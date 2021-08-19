terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.54"
    }
  }
}

// Get the canonical user ID
data "aws_canonical_user_id" "account" {}

locals {
  shortened_role_name_prefix = length(var.bucket_config.bucket) <= 31 ? var.bucket_config.bucket : "${substr(var.bucket_config.bucket, 0, 15)}.${substr(var.bucket_config.bucket, length(var.bucket_config.bucket) - 15, 15)}"
  versioning_enabled         = (var.bucket_config.replication_configuration == null ? false : length(var.bucket_config.replication_configuration.rules) > 0) || (length(var.replication_source_arns) > 0 ? true : (var.bucket_config.versioning == null ? false : var.bucket_config.versioning.enabled))
  versioning_forced          = local.versioning_enabled && (var.bucket_config.versioning == null ? true : !var.bucket_config.versioning.enabled)
  acl_grants = concat(var.bucket_config.grants == null ? [] : var.bucket_config.grants,
    // If the bucket should enable cloudfront logging to it, create an ACL for that
    (var.bucket_config.enable_cloudfront_logging == null ? false : var.bucket_config.enable_cloudfront_logging) ? [{
      // The CloudFront account canonical ID (https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html)
      id          = "c4c1ede66af53448b93c283ce9448c4ba468c9432aa01d700d3878632f77d2d0"
      permissions = ["FULL_CONTROL"]
      type        = "CanonicalUser"
      uri         = null
    }] : [],
    // If there are ACL grants or one was created for CloudFront logging, AND the include_account_owner_acl wasn't specifically set as false,
    // create an ACL to ensure the owner account has full control
    (var.bucket_config.include_account_owner_acl == null ? true : var.bucket_config.include_account_owner_acl) &&
    (
      (var.bucket_config.grants == null ? false : length(var.bucket_config.grants) > 0)
      ||
      (var.bucket_config.enable_cloudfront_logging == null ? false : var.bucket_config.enable_cloudfront_logging)
      ) ? [{
        id          = data.aws_canonical_user_id.account.id
        permissions = ["FULL_CONTROL"]
        type        = "CanonicalUser"
        uri         = null
    }] : []
  )
}
