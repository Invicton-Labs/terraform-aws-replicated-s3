locals {
    buckets = [
        length(aws_s3_bucket.bucket_0) > 0 ? aws_s3_bucket.bucket_0 : null,
        length(aws_s3_bucket.bucket_1) > 0 ? aws_s3_bucket.bucket_1 : null,
        length(aws_s3_bucket.bucket_2) > 0 ? aws_s3_bucket.bucket_2 : null,
    ]
}

resource "aws_s3_bucket" "bucket_0" {
    provider = aws.bucket_0
    count = length(var.buckets) > 0 ? 1 : 0
  bucket = var.buckets[0].bucket
  acl = var.buckets[0].acl

  dynamic "grant" {
      for_each = {for k, v in local.acl_grants[0] : k => v}
      content {
          id = grant.value.id
          type = grant.value.type
          permissions = grant.value.permissions
          uri = grant.value.uri
      }
  }

  tags = var.buckets[0].tags
  force_destroy = var.buckets[0].force_destroy
  dynamic "website" {
      for_each = var.buckets[0].website != null ? [var.buckets[0].website] : []
      content {
          index_document = website.value.index_document
          error_document = website.value.error_document
          redirect_all_requests_to = website.value.redirect_all_requests_to
          routing_rules = website.value.routing_rules
      }
  }

  dynamic "cors_rule" {
      for_each = var.buckets[0].cors_rules != null ? {for k, v in var.buckets[0].cors_rules : k => v} : {}
      content {
        allowed_headers = cors_rule.value.allowed_headers
        allowed_methods = cors_rule.value.allowed_methods
        allowed_origins = cors_rule.value.allowed_origins
        expose_headers = cors_rule.value.expose_headers
        max_age_seconds = cors_rule.value.max_age_seconds
      }
  }

  dynamic "versioning" {
      for_each = var.buckets[0].versioning != null ? [var.buckets[0].versioning] : []
      content {
          enabled = local.versioning_enabled[0]
          mfa_delete = versioning.value.mfa_delete
      }
  }

  dynamic "logging" {
      for_each = var.buckets[0].logging != null ? [var.buckets[0].logging] : []
      content {
          target_bucket = logging.value.target_bucket
          target_prefix = logging.value.target_prefix
      } 
  }

    // Create a special lifecycle rule for expiring non-current versions immediately if
    // versioning wasn't desired, but was required due to replication requirements
  dynamic "lifecycle_rule" {
      for_each = local.versioning_forced[0] ? [1] : []
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
          for k, v in (var.buckets[0].lifecycle_rules != null ? var.buckets[0].lifecycle_rules : []): 
          k => v 
          // Only include the lifecycle rule if versioning wasn't forced (so noncurrent version rules actually mean something)
          // or there is a current version expiration or transition rule
          if !local.versioning_forced[0] || v.expiration != null || v.transition != null
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
              for_each = local.versioning_forced[0] || lifecycle_rule.value.noncurrent_version_expiration == null ? [] : [lifecycle_rule.value.noncurrent_version_expiration]
              content {
                  days = noncurrent_version_expiration.value.days
              }
          }
          dynamic "noncurrent_version_transition" {
              for_each = local.versioning_forced[0] || lifecycle_rule.value.noncurrent_version_transition == null ? [] : [lifecycle_rule.value.noncurrent_version_transition]
              content {
                  days = noncurrent_version_transition.value.days
                  storage_class = noncurrent_version_transition.value.storage_class
              }
          }
      }
  }

  acceleration_status = var.buckets[0].acceleration_status
  request_payer = var.buckets[0].request_payer

  // TODO: replication configuration
  // Ensure a dependency on policy attachment before using the role

  dynamic "server_side_encryption_configuration" {
      for_each = var.buckets[0].server_side_encryption_configuration != null ? [var.buckets[0].server_side_encryption_configuration] : []
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
      for_each = var.buckets[0].object_lock_configuration != null ? [var.buckets[0].object_lock_configuration] : []
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

data "aws_iam_policy_document" "bucket_0" {
    provider = aws.bucket_0
    // Only create the resource if there was a bucket at this index AND there's at least 1 replication source for this bucket
    count = length(aws_s3_bucket.bucket_0) > 0 ? (length(local.replication_source_arns[0]) > 0 ? 1 : 0) : 0
  source_json = var.buckets[0].policy

  statement {
    sid = "replicated-s3-InboundReplication"
    actions = [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
    ]
    resources = [
        "${aws_s3_bucket.bucket_0[count.index].arn}/*"
    ]
    
    principals {
      type        = "AWS"
      identifiers = local.replication_source_role_arns[0]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_0" {
  provider = aws.bucket_0
  count = length(data.aws_iam_policy_document.bucket_0)
  bucket = aws_s3_bucket.bucket_0[0].id
  policy = data.aws_iam_policy_document.bucket_0[0].json
}

resource "aws_s3_bucket_public_access_block" "bucket_0" {
  provider = aws.bucket_0
  count = length(var.buckets) > 0 ? (var.buckets[0].public_access_block != null ? 1 : 0) : 0
  bucket = aws_s3_bucket.bucket_0[0].id
  block_public_acls   = var.buckets[0].public_access_block.block_public_acls
  block_public_policy = var.buckets[0].public_access_block.block_public_policy
  ignore_public_acls = var.buckets[0].public_access_block.ignore_public_acls
  restrict_public_buckets = var.buckets[0].public_access_block.restrict_public_buckets
}


resource "aws_s3_bucket" "bucket_1" {
    provider = aws.bucket_1
    count = length(var.buckets) > 1 ? 1 : 0
  bucket = var.buckets[1].bucket
  acl = var.buckets[1].acl

  dynamic "grant" {
      for_each = {for k, v in local.acl_grants[1] : k => v}
      content {
          id = grant.value.id
          type = grant.value.type
          permissions = grant.value.permissions
          uri = grant.value.uri
      }
  }

  tags = var.buckets[1].tags
  force_destroy = var.buckets[1].force_destroy
  dynamic "website" {
      for_each = var.buckets[1].website != null ? [var.buckets[1].website] : []
      content {
          index_document = website.value.index_document
          error_document = website.value.error_document
          redirect_all_requests_to = website.value.redirect_all_requests_to
          routing_rules = website.value.routing_rules
      }
  }

  dynamic "cors_rule" {
      for_each = var.buckets[1].cors_rules != null ? {for k, v in var.buckets[1].cors_rules : k => v} : {}
      content {
        allowed_headers = cors_rule.value.allowed_headers
        allowed_methods = cors_rule.value.allowed_methods
        allowed_origins = cors_rule.value.allowed_origins
        expose_headers = cors_rule.value.expose_headers
        max_age_seconds = cors_rule.value.max_age_seconds
      }
  }

  dynamic "versioning" {
      for_each = var.buckets[1].versioning != null ? [var.buckets[1].versioning] : []
      content {
          enabled = local.versioning_enabled[1]
          mfa_delete = versioning.value.mfa_delete
      }
  }

  dynamic "logging" {
      for_each = var.buckets[1].logging != null ? [var.buckets[1].logging] : []
      content {
          target_bucket = logging.value.target_bucket
          target_prefix = logging.value.target_prefix
      } 
  }

    // Create a special lifecycle rule for expiring non-current versions immediately if
    // versioning wasn't desired, but was required due to replication requirements
  dynamic "lifecycle_rule" {
      for_each = local.versioning_forced[1] ? [1] : []
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
          for k, v in (var.buckets[1].lifecycle_rules != null ? var.buckets[1].lifecycle_rules : []): 
          k => v 
          // Only include the lifecycle rule if versioning wasn't forced (so noncurrent version rules actually mean something)
          // or there is a current version expiration or transition rule
          if !local.versioning_forced[1] || v.expiration != null || v.transition != null
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
              for_each = local.versioning_forced[1] || lifecycle_rule.value.noncurrent_version_expiration == null ? [] : [lifecycle_rule.value.noncurrent_version_expiration]
              content {
                  days = noncurrent_version_expiration.value.days
              }
          }
          dynamic "noncurrent_version_transition" {
              for_each = local.versioning_forced[1] || lifecycle_rule.value.noncurrent_version_transition == null ? [] : [lifecycle_rule.value.noncurrent_version_transition]
              content {
                  days = noncurrent_version_transition.value.days
                  storage_class = noncurrent_version_transition.value.storage_class
              }
          }
      }
  }

  acceleration_status = var.buckets[1].acceleration_status
  request_payer = var.buckets[1].request_payer

  // TODO: replication configuration
  // Ensure a dependency on policy attachment before using the role

  dynamic "server_side_encryption_configuration" {
      for_each = var.buckets[1].server_side_encryption_configuration != null ? [var.buckets[1].server_side_encryption_configuration] : []
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
      for_each = var.buckets[1].object_lock_configuration != null ? [var.buckets[1].object_lock_configuration] : []
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

data "aws_iam_policy_document" "bucket_1" {
    provider = aws.bucket_1
    // Only create the resource if there was a bucket at this index AND there's at least 1 replication source for this bucket
    count = length(aws_s3_bucket.bucket_1) > 0 ? (length(local.replication_source_arns[1]) > 0 ? 1 : 0) : 0
  source_json = var.buckets[1].policy

  statement {
    sid = "replicated-s3-InboundReplication"
    actions = [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
    ]
    resources = [
        "${aws_s3_bucket.bucket_1[count.index].arn}/*"
    ]
    
    principals {
      type        = "AWS"
      identifiers = local.replication_source_role_arns[1]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_1" {
  provider = aws.bucket_1
  count = length(data.aws_iam_policy_document.bucket_1)
  bucket = aws_s3_bucket.bucket_1[0].id
  policy = data.aws_iam_policy_document.bucket_1[0].json
}

resource "aws_s3_bucket_public_access_block" "bucket_1" {
  provider = aws.bucket_1
  count = length(var.buckets) > 1 ? (var.buckets[1].public_access_block != null ? 1 : 0) : 0
  bucket = aws_s3_bucket.bucket_1[0].id
  block_public_acls   = var.buckets[1].public_access_block.block_public_acls
  block_public_policy = var.buckets[1].public_access_block.block_public_policy
  ignore_public_acls = var.buckets[1].public_access_block.ignore_public_acls
  restrict_public_buckets = var.buckets[1].public_access_block.restrict_public_buckets
}


resource "aws_s3_bucket" "bucket_2" {
    provider = aws.bucket_2
    count = length(var.buckets) > 2 ? 1 : 0
  bucket = var.buckets[2].bucket
  acl = var.buckets[2].acl

  dynamic "grant" {
      for_each = {for k, v in local.acl_grants[2] : k => v}
      content {
          id = grant.value.id
          type = grant.value.type
          permissions = grant.value.permissions
          uri = grant.value.uri
      }
  }

  tags = var.buckets[2].tags
  force_destroy = var.buckets[2].force_destroy
  dynamic "website" {
      for_each = var.buckets[2].website != null ? [var.buckets[2].website] : []
      content {
          index_document = website.value.index_document
          error_document = website.value.error_document
          redirect_all_requests_to = website.value.redirect_all_requests_to
          routing_rules = website.value.routing_rules
      }
  }

  dynamic "cors_rule" {
      for_each = var.buckets[2].cors_rules != null ? {for k, v in var.buckets[2].cors_rules : k => v} : {}
      content {
        allowed_headers = cors_rule.value.allowed_headers
        allowed_methods = cors_rule.value.allowed_methods
        allowed_origins = cors_rule.value.allowed_origins
        expose_headers = cors_rule.value.expose_headers
        max_age_seconds = cors_rule.value.max_age_seconds
      }
  }

  dynamic "versioning" {
      for_each = var.buckets[2].versioning != null ? [var.buckets[2].versioning] : []
      content {
          enabled = local.versioning_enabled[2]
          mfa_delete = versioning.value.mfa_delete
      }
  }

  dynamic "logging" {
      for_each = var.buckets[2].logging != null ? [var.buckets[2].logging] : []
      content {
          target_bucket = logging.value.target_bucket
          target_prefix = logging.value.target_prefix
      } 
  }

    // Create a special lifecycle rule for expiring non-current versions immediately if
    // versioning wasn't desired, but was required due to replication requirements
  dynamic "lifecycle_rule" {
      for_each = local.versioning_forced[2] ? [1] : []
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
          for k, v in (var.buckets[2].lifecycle_rules != null ? var.buckets[2].lifecycle_rules : []): 
          k => v 
          // Only include the lifecycle rule if versioning wasn't forced (so noncurrent version rules actually mean something)
          // or there is a current version expiration or transition rule
          if !local.versioning_forced[2] || v.expiration != null || v.transition != null
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
              for_each = local.versioning_forced[2] || lifecycle_rule.value.noncurrent_version_expiration == null ? [] : [lifecycle_rule.value.noncurrent_version_expiration]
              content {
                  days = noncurrent_version_expiration.value.days
              }
          }
          dynamic "noncurrent_version_transition" {
              for_each = local.versioning_forced[2] || lifecycle_rule.value.noncurrent_version_transition == null ? [] : [lifecycle_rule.value.noncurrent_version_transition]
              content {
                  days = noncurrent_version_transition.value.days
                  storage_class = noncurrent_version_transition.value.storage_class
              }
          }
      }
  }

  acceleration_status = var.buckets[2].acceleration_status
  request_payer = var.buckets[2].request_payer

  // TODO: replication configuration
  // Ensure a dependency on policy attachment before using the role

  dynamic "server_side_encryption_configuration" {
      for_each = var.buckets[2].server_side_encryption_configuration != null ? [var.buckets[2].server_side_encryption_configuration] : []
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
      for_each = var.buckets[2].object_lock_configuration != null ? [var.buckets[2].object_lock_configuration] : []
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

data "aws_iam_policy_document" "bucket_2" {
    provider = aws.bucket_2
    // Only create the resource if there was a bucket at this index AND there's at least 1 replication source for this bucket
    count = length(aws_s3_bucket.bucket_2) > 0 ? (length(local.replication_source_arns[2]) > 0 ? 1 : 0) : 0
  source_json = var.buckets[2].policy

  statement {
    sid = "replicated-s3-InboundReplication"
    actions = [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
    ]
    resources = [
        "${aws_s3_bucket.bucket_2[count.index].arn}/*"
    ]
    
    principals {
      type        = "AWS"
      identifiers = local.replication_source_role_arns[2]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_2" {
  provider = aws.bucket_2
  count = length(data.aws_iam_policy_document.bucket_2)
  bucket = aws_s3_bucket.bucket_2[0].id
  policy = data.aws_iam_policy_document.bucket_2[0].json
}

resource "aws_s3_bucket_public_access_block" "bucket_2" {
  provider = aws.bucket_2
  count = length(var.buckets) > 2 ? (var.buckets[2].public_access_block != null ? 1 : 0) : 0
  bucket = aws_s3_bucket.bucket_2[0].id
  block_public_acls   = var.buckets[2].public_access_block.block_public_acls
  block_public_policy = var.buckets[2].public_access_block.block_public_policy
  ignore_public_acls = var.buckets[2].public_access_block.ignore_public_acls
  restrict_public_buckets = var.buckets[2].public_access_block.restrict_public_buckets
}


