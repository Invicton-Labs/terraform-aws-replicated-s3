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
    bucket_arns = [
        for idx, bucket in var.buckets:
        "arn:aws:s3:::${bucket.bucket}"
    ]
    // A list of lists, where the first dimension index is a bucket index, and the second dimension list is the list of all buckets indexes that it replicates to
    replication_destination_modules = [
        for idx, bucket in var.buckets:
        [
            for rule in bucket.replication_configuration == null ? [] : bucket.replication_configuration.rules:
                rule.destination.module_bucket_index
                // Only include the destination if it's included and it's not the same as this bucket
                if rule.destination.module_bucket_index != idx
        ]
    ]
    // A list of lists, where the first dimension index is a bucket index, and the second dimension list is the list of all bucket ARNs that it replicates to
    replication_destination_arns = [
        for idx, bucket in var.buckets:
        [
            for rule in bucket.replication_configuration == null ? [] : bucket.replication_configuration.rules:
                rule.destination.bucket != null ? rule.destination.bucket : local.bucket_arns[rule.destination.module_bucket_index]
                // Only include the destination if the ARN isn't the same as the source
                if rule.destination.bucket != null ? rule.destination.bucket != local.bucket_arns[idx] : rule.destination.module_bucket_index != idx
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
            local.replication_roles[source_idx].arn
            if contains(source_destinations, dest_idx)
        ]
    ]
}