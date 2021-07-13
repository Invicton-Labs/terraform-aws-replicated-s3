locals {
    buckets = [
%{ for idx in range(num_buckets) ~}
        length(aws_s3_bucket.bucket_${idx}) > 0 ? aws_s3_bucket.bucket_${idx} : null,
%{ endfor ~}
    ]
}

%{ for idx in range(num_buckets) ~}
resource "aws_s3_bucket" "bucket_${idx}" {
    provider = aws.bucket_${idx}
    count = length(var.buckets) > ${idx} ? 1 : 0
  bucket = var.buckets[${idx}].bucket
  acl = var.buckets[${idx}].acl

  dynamic "grant" {
      for_each = {for k, v in local.acl_grants[${idx}] : k => v}
      content {
          id = grant.value.id
          type = grant.value.type
          permissions = grant.value.permissions
          uri = grant.value.uri
      }
  }

  tags = var.buckets[${idx}].tags
  force_destroy = var.buckets[${idx}].force_destroy
  dynamic "website" {
      for_each = var.buckets[${idx}].website != null ? [var.buckets[${idx}].website] : []
      content {
          index_document = website.value.index_document
          error_document = website.value.error_document
          redirect_all_requests_to = website.value.redirect_all_requests_to
          routing_rules = website.value.routing_rules
      }
  }

  dynamic "cors_rule" {
      for_each = var.buckets[${idx}].cors_rules != null ? {for k, v in var.buckets[${idx}].cors_rules : k => v} : {}
      content {
        allowed_headers = cors_rule.value.allowed_headers
        allowed_methods = cors_rule.value.allowed_methods
        allowed_origins = cors_rule.value.allowed_origins
        expose_headers = cors_rule.value.expose_headers
        max_age_seconds = cors_rule.value.max_age_seconds
      }
  }

  dynamic "versioning" {
      for_each = var.buckets[${idx}].versioning != null ? [var.buckets[${idx}].versioning] : []
      content {
          enabled = local.versioning_enabled[${idx}]
          mfa_delete = versioning.value.mfa_delete
      }
  }

  dynamic "logging" {
      for_each = var.buckets[${idx}].logging != null ? [var.buckets[${idx}].logging] : []
      content {
          target_bucket = logging.value.target_bucket
          target_prefix = logging.value.target_prefix
      } 
  }

    // Create a special lifecycle rule for expiring non-current versions immediately if
    // versioning wasn't desired, but was required due to replication requirements
  dynamic "lifecycle_rule" {
      for_each = local.versioning_forced[${idx}] ? [1] : []
      content {
          id = "remove-versions-required-for-replication"
          enabled = true
          noncurrent_version_expiration {
              // Minimum expiration time is 1 day
            days = 1
          }
      }
  }

  dynamic "lifecycle_rule" {
      for_each = {
          for k, v in (var.buckets[${idx}].lifecycle_rules != null ? var.buckets[${idx}].lifecycle_rules : []): 
          k => v 
          // Only include the lifecycle rule if versioning wasn't forced (so noncurrent version rules actually mean something)
          // or there is a current version expiration or transition rule
          if !local.versioning_forced[${idx}] || v.expiration != null || v.transition != null
      }
      content {
          id = lifecycle_rule.value.id
          prefix = lifecycle_rule.value.prefix
          tags = lifecycle_rule.value.tags
          enabled = lifecycle_rule.value.enabled
          abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days
          dynamic "expiration" {
              for_each = lifecycle_rule.value.expiration != null ? [lifecycle_rule.value.expiration] : []
            content {
                date = expiration.value.date
                days = expiration.value.days
                expired_object_delete_marker = expiration.value.expired_object_delete_marker
            }
          }
          dynamic "transition" {
              for_each = lifecycle_rule.value.transition != null ? [lifecycle_rule.value.transition] : []
            content {
                date = transition.value.date
                days = transition.value.days
                storage_class = transition.value.storage_class
            }
          }
          
          // Only include the noncurrent version rules if versioning wasn't forced (in which case expiration is set as 
          // soon as possible, above) AND the rule was specified
          dynamic "noncurrent_version_expiration" {
              for_each = local.versioning_forced[${idx}] || lifecycle_rule.value.noncurrent_version_expiration == null ? [] : [lifecycle_rule.value.noncurrent_version_expiration]
              content {
                  days = noncurrent_version_expiration.value.days
              }
          }
          dynamic "noncurrent_version_transition" {
              for_each = local.versioning_forced[${idx}] || lifecycle_rule.value.noncurrent_version_transition == null ? [] : [lifecycle_rule.value.noncurrent_version_transition]
              content {
                  days = noncurrent_version_transition.value.days
                  storage_class = noncurrent_version_transition.value.storage_class
              }
          }
      }
  }

  acceleration_status = var.buckets[${idx}].acceleration_status
  request_payer = var.buckets[${idx}].request_payer

  // TODO: replication configuration
  // Ensure a dependency on policy attachment before using the role

  dynamic "server_side_encryption_configuration" {
      for_each = var.buckets[${idx}].server_side_encryption_configuration != null ? [var.buckets[${idx}].server_side_encryption_configuration] : []
      content {
          rule {
              apply_server_side_encryption_by_default {
                  sse_algorithm = server_side_encryption_configuration.value.rule.apply_server_side_encryption_by_default.sse_algorithm
                  kms_master_key_id = server_side_encryption_configuration.value.rule.apply_server_side_encryption_by_default.kms_master_key_id
              }
              bucket_key_enabled = server_side_encryption_configuration.value.rule.bucket_key_enabled
          }
      }
  }

  dynamic "object_lock_configuration" {
      for_each = var.buckets[${idx}].object_lock_configuration != null ? [var.buckets[${idx}].object_lock_configuration] : []
      content {
          object_lock_enabled = object_lock_configuration.value.object_lock_enabled
          dynamic "rule" {
              for_each = object_lock_configuration.value.rule != null ? [object_lock_configuration.value.rule] : []
              content {
                  default_retention {
                      mode = rule.value.default_retention.mode
                      days = rule.value.default_retention.days
                      years = rule.value.default_retention.years
                  }
              }
          }
      }
  }
}

data "aws_iam_policy_document" "bucket_${idx}" {
    provider = aws.bucket_${idx}
    // Only create the resource if there was a bucket at this index AND there's at least 1 replication source for this bucket
    count = length(aws_s3_bucket.bucket_${idx}) > 0 ? (length(local.replication_source_arns[${idx}]) > 0 ? 1 : 0) : 0
  source_json = var.buckets[${idx}].policy

  statement {
    sid = "replicated-s3-InboundReplication"
    actions = [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
    ]
    resources = [
        "$${aws_s3_bucket.bucket_${idx}[count.index].arn}/*"
    ]
    
    principals {
      type        = "AWS"
      identifiers = local.replication_source_role_arns[${idx}]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_${idx}" {
  provider = aws.bucket_${idx}
  count = length(data.aws_iam_policy_document.bucket_${idx})
  bucket = aws_s3_bucket.bucket_${idx}[0].id
  policy = data.aws_iam_policy_document.bucket_${idx}[0].json
}

resource "aws_s3_bucket_public_access_block" "bucket_${idx}" {
  provider = aws.bucket_${idx}
  count = length(var.buckets) > ${idx} ? (var.buckets[${idx}].public_access_block != null ? 1 : 0) : 0
  bucket = aws_s3_bucket.bucket_${idx}[0].id
  block_public_acls   = var.buckets[${idx}].public_access_block.block_public_acls
  block_public_policy = var.buckets[${idx}].public_access_block.block_public_policy
  ignore_public_acls = var.buckets[${idx}].public_access_block.ignore_public_acls
  restrict_public_buckets = var.buckets[${idx}].public_access_block.restrict_public_buckets
}


%{ endfor ~}
