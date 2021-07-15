/*
locals {
    invalid_bucket_name_idx = [
      for idx, bucket in var.buckets:
      idx
      if (bucket.bucket != null && bucket.module_bucket_index != null) 
        ||
        (bucket.bucket == null && bucket.module_bucket_index == null) 
    ]
}

// Check that a valid name is given for each one
module "assert_bucket_name_valid" {
  source  = "Invicton-Labs/assertion/null//examples/windows-only"
  version = "0.1.2"
  condition = length(local.invalid_bucket_name_idx) == 0
  error_message = "The bucket configuration(s) at indecies [${join(", ", local.invalid_bucket_name_idx)}] are invalid. A bucket configuration must have either `bucket` or `bucket_prefix` provided, but not both."
}
*/