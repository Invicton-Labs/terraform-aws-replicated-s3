terraform {
  required_version = ">= 1.0.0"
  experiments      = [module_variable_optional_attrs]
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.54"
    }
  }
}

locals {
  bucket_arns = {
    for k, v in var.bucket_configs :
    k => "arn:aws:s3:::${v.bucket}"
  }
  // A map of lists, where the map key is the bucket key, and the value is the list of all bucket keys that it replicates to
  replication_destination_modules = {
    for k, bucket in var.bucket_configs :
    k => [
      for rule in bucket.replication_configuration == null ? [] : bucket.replication_configuration.rules :
      rule.destination.module_bucket_key
      // Only include the destination if it's included and it's not the same as this bucket
      if rule.destination.module_bucket_key != k
    ]
  }
  // A map of lists, where the map key is the bucket key, and the value is the list of all bucket ARNs that it replicates to
  replication_destination_arns = {
    for k, bucket in var.bucket_configs :
    k => [
      for rule in bucket.replication_configuration == null ? [] : bucket.replication_configuration.rules :
      rule.destination.bucket != null ? rule.destination.bucket : local.bucket_arns[rule.destination.module_bucket_key]
      // Only include the destination if the ARN isn't the same as the source
      if rule.destination.bucket != null ? rule.destination.bucket != local.bucket_arns[k] : rule.destination.module_bucket_key != k
    ]
  }
  // A list of lists, where the first dimension index is a bucket index, and the second dimension list is the list of all bucket indexes that replicate to that bucket
  replication_source_arns = {
    for dest_k, dest_bucket in var.bucket_configs :
    dest_k => [
      for source_k, source_destinations in local.replication_destination_modules :
      local.bucket_arns[source_k]
      if contains(source_destinations, dest_k)
    ]
  }

  bucket_modules = {
    for k, v in var.bucket_regions :
    k => local.region_bucket_modules[v][k]
  }

  replication_modules = {
    for k, v in var.bucket_regions :
    k => local.region_replication_modules[v][k]
  }
}
