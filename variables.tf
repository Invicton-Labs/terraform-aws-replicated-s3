variable "buckets" {
    description = "A list of configuration objects for each bucket."
    type = list(object({
        bucket = string
        acl = optional(string)
        grants = optional(list(object({
            id = optional(string)
            type = string
            permissions = list(string)
            uri = optional(string)
        })))
        policy = optional(string)
        tags = optional(map(string))
        force_destroy = optional(bool)
        website = optional(object({
            index_document = optional(string)
            error_document = optional(string)
            redirect_all_requests_to = optional(string)
            routing_rules = optional(string)
        }))
        cors_rules = optional(list(object({
            allowed_headers = optional(list(string))
            allowed_methods = list(string)
            allowed_origins = list(string)
            expose_headers = optional(list(string))
            max_age_seconds = optional(number)
        })))
        versioning = optional(object({
            enabled = optional(bool)
            mfa_delete = optional(bool)
        }))
        logging = optional(object({
            target_bucket = bool
            target_prefix = optional(string)
        }))
        lifecycle_rules = optional(list(object({
            id = optional(string)
            prefix = optional(string)
            tags = optional(map(string))
            enabled = bool
            abort_incomplete_multipart_upload_days = optional(number)
            expiration = optional(object({
                date = optional(string)
                days = optional(number)
                expired_object_delete_marker = optional(bool)
            }))
            transitions = optional(list(object({
                date = optional(string)
                days = optional(number)
                storage_class = string
            })))
            noncurrent_version_expiration = optional(object({
                days = number
            }))
            noncurrent_version_transitions = optional(list(object({
                days = number
                storage_class = string
            })))
        })))
        acceleration_status = optional(string)
        request_payer = optional(string)
        replication_configuration = optional(object({
            role = optional(string)
            rules = list(object({
                id = optional(string)
                priority = optional(number)
                destination = object({
                    bucket = optional(string)
                    module_bucket_index = optional(number)
                    storage_class = optional(string)
                    replica_kms_key_id = optional(string)
                    access_control_translation = optional(object({
                        owner = string
                    }))
                    account_id = optional(string)
                })
                source_selection_criteria = optional(object({
                    sse_kms_encrypted_objects = optional(object({
                        enabled = bool
                    }))
                }))
                prefix = optional(string)
                status = string
                filter = optional(object({
                    prefix = optional(string)
                    tags = optional(map(string))
                }))
            }))
        }))
        server_side_encryption_configuration = optional(object({
            rule = object({
                apply_server_side_encryption_by_default = object({
                    sse_algorithm = string
                    kms_master_key_id = optional(string)
                })
                bucket_key_enabled = optional(bool)
            })
        }))
        object_lock_configuration = optional(object({
            object_lock_enabled = bool
            rule = optional(object({
                default_retention = object({
                    mode = string
                    days = optional(number)
                    years = optional(number)
                })
            }))
        }))
        // Whether to create an ACL to allow CloudFront logging (defaults to false)
        enable_cloudfront_logging = optional(bool)
        // Whether to add an ACL for the owner account if ACL grants are specified (defaults to true)
        include_account_owner_acl = optional(bool)
        // Whether to block all public access (defaults to true)
        public_access_block = optional(object({
            block_public_acls = optional(bool)
            block_public_policy = optional(bool)
            ignore_public_acls = optional(bool)
            restrict_public_buckets = optional(bool)
        }))
    }))
}