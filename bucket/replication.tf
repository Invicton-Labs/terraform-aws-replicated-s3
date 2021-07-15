locals {
    replication_config = var.bucket == null ? null : (var.bucket.replication_configuration == null ? null : {
        Bucket = aws_s3_bucket.bucket[0].arn,
        ReplicationConfiguration = {
            Role = length(aws_iam_role.replication) > 0 ? aws_iam_role.replication[0].arn,
            Rules = [
                for rule in var.bucket.replication_configuration.rules:
                {
                    ID = rule.id,
                    Priority = rule.priority,
                    Prefix = rule.prefix,
                    Filter = {
                        And = {
                            Prefix = rule.prefix
                            Tags = [
                                for k, v in rule.tags:
                                {
                                    Key = k,
                                    Value = v
                                }
                            ]
                        }
                    },
                    Status = rule.status,
                    SourceSelectionCriteria = rule.source_selection_criteria == null ? null : {
                        SseKmsEncryptedObjects = rule.source_selection_criteria.sse_kms_encrypted_objects == null ? null : {
                            Status = rule.source_selection_criteria.sse_kms_encrypted_objects.enabled ? "Enabled" : "Disabled"
                        },
                        ReplicaModifications = rule.source_selection_criteria.replica_modifications == null ? null : {
                            Status = rule.source_selection_criteria.replica_modifications.enabled ? "Enabled" : "Disabled"
                        },
                    },
                    ExistingObjectReplication = rule.existing_object_replication == null ? null : {
                        Status = rule.existing_object_replication.enabled ? "Enabled" : "Disabled"
                    },
                    Destination = {
                        Bucket = rule.destination.bucket != null ? rule.destination.bucket : var.bucket_arns[rule.destination.module_bucket_index]
                        Account = rule.destination.account_id
                        StorageClass = rule.destination.storage_class
                        AccessControlTranslation = rule.destination.access_control_translation == null ? null : {
                            Owner = rule.destination.access_control_translation.owner
                        },
                        EncryptionConfiguration = rule.destination.replica_kms_key_id == null ? null : {
                            ReplicaKmsKeyID = rule.destination.replica_kms_key_id
                        },
                        ReplicationTime = rule.replication_time == null ? null : {
                            Status = rule.replication_time.enabled ? "Enabled" : "Disabled"
                            Time = {
                                Minutes = rule.replication_time.time.minutes
                            }
                        },
                        Metrics = rule.metrics == null ? null : {
                            Status = rule.metrics.enabled ? "Enabled" : "Disabled",
                            EventThreshold = rule.metrics.event_threshold == null ? null : {
                                Minutes = rule.metrics.event_threshold.minutes
                            }
                        }
                    },
                    DeleteMarkerReplication = rule.delete_marker_replication == null ? null : {
                        Status = rule.delete_marker_replication.enabled ? "Enabled" : "Disabled"
                    }
                }
            ]
        },
        ExpectedBucketOwner = data.aws_caller_identity.current.account_id
    })
}

module "shell_resource_hello" {
  source  = "Invicton-Labs/shell-resource/external"
  version = "0.1.0"

  // The command to run on resource creation on Unix machines
  command_unix         = "aws"

  // The command to run on resource destruction on Unix machines
  command_when_destroy_unix         = "echo \"$TEXT $MORETEXT\""

  // Whether Terraform should exit with an error message if the command returns a non-zero exit status
  fail_on_error   = true

  // Environment variables (will appear in plain text in the Terraform plan output)
  environment = {
    TEXT     = "Hello"
    DESTROY_TEXT = "Goodbye"
  }

  // Environment variables that, when changed, will not trigger a re-create
  triggerless_environment = {
    ORIGINAL_CREATED_TIME = timestamp()
  }
}