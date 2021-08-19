locals {
  // Wait for the bucket_prepped variable to ensure everything other than replication is configured for buckets
  replication_config = var.bucket_config.replication_configuration == null ? null : (length(var.bucket_config.replication_configuration.rules) == 0 ? null : {
    Role = var.replication_role_arn,
    Rules = [
      for rule in var.bucket_config.replication_configuration.rules :
      {
        for k1, v1 in {
          ID       = rule.id,
          Priority = rule.priority,
          Prefix   = rule.prefix,
          Filter = rule.filter == null ? null : {
            And = {
              for k2, v2 in {
                Prefix = rule.filter.prefix
                Tags = [
                  for k, v in rule.filter.tags :
                  {
                    Key   = k,
                    Value = v
                  }
                ]
              } :
              k2 => v2
              if v2 != null
            }
          },
          Status = rule.status,
          SourceSelectionCriteria = rule.source_selection_criteria == null ? null : {
            for k3, v3 in {
              SseKmsEncryptedObjects = rule.source_selection_criteria.sse_kms_encrypted_objects == null ? null : {
                Status = rule.source_selection_criteria.sse_kms_encrypted_objects.enabled ? "Enabled" : "Disabled"
              },
              ReplicaModifications = rule.source_selection_criteria.replica_modifications == null ? null : {
                Status = rule.source_selection_criteria.replica_modifications.enabled ? "Enabled" : "Disabled"
              },
            } :
            k3 => v3
            if v3 != null
          },
          ExistingObjectReplication = rule.existing_object_replication == null ? null : {
            Status = rule.existing_object_replication.enabled ? "Enabled" : "Disabled"
          },
          Destination = {
            for k4, v4 in {
              Bucket       = rule.destination.bucket != null ? rule.destination.bucket : var.bucket_arns[rule.destination.module_bucket_key]
              Account      = rule.destination.account_id
              StorageClass = rule.destination.storage_class
              AccessControlTranslation = rule.destination.access_control_translation == null ? null : {
                Owner = rule.destination.access_control_translation.owner
              },
              EncryptionConfiguration = rule.destination.replica_kms_key_id == null ? null : {
                ReplicaKmsKeyID = rule.destination.replica_kms_key_id
              },
              ReplicationTime = rule.destination.replication_time == null ? null : {
                Status = rule.destination.replication_time.enabled ? "Enabled" : "Disabled"
                Time = {
                  Minutes = rule.destination.replication_time.time.minutes
                }
              },
              Metrics = rule.destination.metrics == null ? null : {
                for k5, v5 in {
                  Status = rule.destination.metrics.enabled ? "Enabled" : "Disabled",
                  EventThreshold = rule.destination.metrics.event_threshold == null ? null : {
                    Minutes = rule.destination.metrics.event_threshold.minutes
                  }
                } :
                k5 => v5
                if v5 != null
              }
            } :
            k4 => v4
            if v4 != null
          },
          DeleteMarkerReplication = rule.delete_marker_replication == null ? null : {
            Status = rule.delete_marker_replication.enabled ? "Enabled" : "Disabled"
          }
        } :
        k1 => v1
        if v1 != null
      }
    ]
  })
}

module "set_replication_config" {
  source          = "Invicton-Labs/shell-resource/external"
  version         = "~> 0.1.1"
  fail_on_error   = true
  command_unix    = "aws s3api put-bucket-replication --bucket \"$BUCKET\" --replication-configuration '${jsonencode(local.replication_config)}' --expected-bucket-owner \"$OWNER\""
  command_windows = "aws s3api put-bucket-replication --bucket \"$Env:BUCKET\" --replication-configuration '${replace(jsonencode(local.replication_config), "\"", "\\\"\"")}' --expected-bucket-owner \"$Env:OWNER\""
  environment = {
    BUCKET = var.bucket_id
    OWNER  = data.aws_caller_identity.current.account_id
  }
}
