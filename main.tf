terraform {
  required_version = ">= 1.0.0"
  experiments      = [module_variable_optional_attrs]
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.49"
    }
  }
}

locals {
  bucket_count_limit = 20
  /*
  shortened_role_name_prefixes = [
      for idx, bucket in var.buckets:
      length(bucket.bucket) <= 31 ? bucket.bucket : "${substr(bucket.bucket, 0, 15)}.${substr(bucket.bucket, length(bucket.bucket) - 15, 15)}"
  ]
  bucket_arns = [
        for idx, bucket in var.buckets:
        "arn:aws:s3:::${bucket.bucket}"
    ]
    */
    // A list of lists, where the first dimension index is a bucket index, and the second dimension list is the list of all buckets indexes that it replicates to
    replication_destination_modules = [
        for idx, bucket in var.buckets:
        [
            for rule in bucket.replication_configuration == null ? [] : bucket.replication_configuration.rules:
                rule.destination.module_bucket_index
                // Only include the destination if it's included and it's not the same as this bucket
                if rule.destination.module_bucket_index != null && lookup(rule.destination, "module_bucket_index", null) != idx
        ]
    ]
    replication_destination_arns = [
        for idx, bucket in var.buckets:
        [
            for rule in bucket.replication_configuration == null ? [] : bucket.replication_configuration.rules:
                rule.destination.bucket != null ? rule.destination.bucket : local.bucket_arns[rule.destination.module_bucket_index]
                // Only include the destination if the ARN isn't the same as the source
                if rule.destination.bucket != null ? rule.destination.bucket != local.bucket_arns[idx] : local.bucket_arns[rule.destination.module_bucket_index] != local.bucket_arns[idx]
        ]
    ]
    // A list of lists, where the first dimension index is a bucket index, and the second dimension list is the list of all bucket indexes that replicate to that bucket
    replication_source_arns = [
        for dest_idx, dest_bucket in var.buckets:
        [
            for source_idx, source_destinations in local.replication_destination_modules:
            local.bucket_arns[source_idx]
            if contains(source_destinations, dest_idx)
        ]
    ]
    replication_source_role_arns = [
        for dest_idx, dest_bucket in var.buckets:
        [
            for source_idx, source_destinations in local.replication_destination_modules:
            // A role is guaranteed to have been created for a bucket if it's the source for a replication
            local.replication_roles[source_idx][0].arn
            if contains(source_destinations, dest_idx)
        ]
    ]
    /*
    // Versioning MUST be enabled if this bucket is either the source or destination for replication
    // Otherwise, use the provided value
    versioning_enabled = [
        for idx, bucket in var.buckets:
        (bucket.replication_configuration != null ? length(bucket.replication_configuration.rules) > 0 : false) || length(local.replication_source_arns[idx]) > 0 ? true : (bucket.versioning == null ? false : bucket.versioning.enabled)
    ]
    // Versioning is forced if it's enabled, but wasn't asked for
    versioning_forced = [
        for idx, bucket in var.buckets:
        local.versioning_enabled[idx] && (bucket.versioning == null ? true : !bucket.versioning.enabled)
    ]
    /*
    acl_grants = [
        for idx, bucket in var.buckets:
        concat(bucket.grants == null ? [] : bucket.grants,
            // If the bucket should enable cloudfront logging to it, create an ACL for that
            (bucket.enable_cloudfront_logging == null ? false : bucket.enable_cloudfront_logging) ? [{
                // The CloudFront account canonical ID (https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html)
                id          = "c4c1ede66af53448b93c283ce9448c4ba468c9432aa01d700d3878632f77d2d0"
                permissions = ["FULL_CONTROL"]
                type        = "CanonicalUser"
                uri         = null
            }] : [],
            // If there are ACL grants or one was created for CloudFront logging, AND the include_account_owner_acl wasn't specifically set as false,
            // create an ACL to ensure the owner account has full control
            (bucket.include_account_owner_acl == null ? true : bucket.include_account_owner_acl) && 
            (
                (bucket.grants == null ? false : length(bucket.grants) > 0)
                    || 
                (bucket.enable_cloudfront_logging == null ? false : bucket.enable_cloudfront_logging)
            ) ? [{
                id          = local.canonical_ids[idx]
                permissions = ["FULL_CONTROL"]
                type        = "CanonicalUser"
                uri         = null
            }] : []
        )
    ]*/
}