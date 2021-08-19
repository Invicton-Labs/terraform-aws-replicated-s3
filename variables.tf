variable "provider_config" {
  description = "The AWS provider configuration. Uses the same fields as the AWS `provider` block."
  type = object({
    access_key = optional(string)
    secret_key = optional(string)
    region     = optional(string)
    profile    = optional(string)
    assume_role = optional(object({
      duration_seconds    = optional(number)
      external_id         = optional(string)
      policy              = optional(string)
      policy_arns         = optional(list(string))
      role_arn            = optional(string)
      session_name        = optional(string)
      tags                = optional(map(string))
      transitive_tag_keys = optional(list(string))
    }))
    endpoints = optional(object({
      accessanalyzer           = optional(string)
      acm                      = optional(string)
      acmpca                   = optional(string)
      amplify                  = optional(string)
      apigateway               = optional(string)
      appconfig                = optional(string)
      applicationautoscaling   = optional(string)
      applicationinsights      = optional(string)
      appmesh                  = optional(string)
      apprunner                = optional(string)
      appstream                = optional(string)
      appsync                  = optional(string)
      athena                   = optional(string)
      auditmanager             = optional(string)
      autoscaling              = optional(string)
      autoscalingplans         = optional(string)
      backup                   = optional(string)
      batch                    = optional(string)
      budgets                  = optional(string)
      chime                    = optional(string)
      cloud9                   = optional(string)
      cloudformation           = optional(string)
      cloudfront               = optional(string)
      cloudhsm                 = optional(string)
      cloudsearch              = optional(string)
      cloudtrail               = optional(string)
      cloudwatch               = optional(string)
      cloudwatchevents         = optional(string)
      cloudwatchlogs           = optional(string)
      codeartifact             = optional(string)
      codebuild                = optional(string)
      codecommit               = optional(string)
      codedeploy               = optional(string)
      codepipeline             = optional(string)
      codestarconnections      = optional(string)
      codestarnotifications    = optional(string)
      cognitoidentity          = optional(string)
      cognitoidp               = optional(string)
      configservice            = optional(string)
      connect                  = optional(string)
      cur                      = optional(string)
      dataexchange             = optional(string)
      datapipeline             = optional(string)
      datasync                 = optional(string)
      dax                      = optional(string)
      detective                = optional(string)
      devicefarm               = optional(string)
      directconnect            = optional(string)
      dlm                      = optional(string)
      dms                      = optional(string)
      docdb                    = optional(string)
      ds                       = optional(string)
      dynamodb                 = optional(string)
      ec2                      = optional(string)
      ecr                      = optional(string)
      ecrpublic                = optional(string)
      ecs                      = optional(string)
      efs                      = optional(string)
      eks                      = optional(string)
      elasticache              = optional(string)
      elasticbeanstalk         = optional(string)
      elastictranscoder        = optional(string)
      elb                      = optional(string)
      emr                      = optional(string)
      emrcontainers            = optional(string)
      es                       = optional(string)
      firehose                 = optional(string)
      fms                      = optional(string)
      forecast                 = optional(string)
      fsx                      = optional(string)
      gamelift                 = optional(string)
      glacier                  = optional(string)
      globalaccelerator        = optional(string)
      glue                     = optional(string)
      guardduty                = optional(string)
      greengrass               = optional(string)
      iam                      = optional(string)
      identitystore            = optional(string)
      imagebuilder             = optional(string)
      inspector                = optional(string)
      iot                      = optional(string)
      iotanalytics             = optional(string)
      iotevents                = optional(string)
      kafka                    = optional(string)
      kinesis                  = optional(string)
      kinesisanalytics         = optional(string)
      kinesisanalyticsv2       = optional(string)
      kinesisvideo             = optional(string)
      kms                      = optional(string)
      lakeformation            = optional(string)
      lambda                   = optional(string)
      lexmodels                = optional(string)
      licensemanager           = optional(string)
      lightsail                = optional(string)
      location                 = optional(string)
      macie                    = optional(string)
      macie2                   = optional(string)
      managedblockchain        = optional(string)
      marketplacecatalog       = optional(string)
      mediaconnect             = optional(string)
      mediaconvert             = optional(string)
      medialive                = optional(string)
      mediapackage             = optional(string)
      mediastore               = optional(string)
      mediastoredata           = optional(string)
      mq                       = optional(string)
      mwaa                     = optional(string)
      neptune                  = optional(string)
      networkfirewall          = optional(string)
      networkmanager           = optional(string)
      opsworks                 = optional(string)
      organizations            = optional(string)
      outposts                 = optional(string)
      personalize              = optional(string)
      pinpoint                 = optional(string)
      pricing                  = optional(string)
      prometheusservice        = optional(string)
      qldb                     = optional(string)
      quicksight               = optional(string)
      ram                      = optional(string)
      rds                      = optional(string)
      redshift                 = optional(string)
      resourcegroups           = optional(string)
      resourcegroupstaggingapi = optional(string)
      route53                  = optional(string)
      route53domains           = optional(string)
      route53resolver          = optional(string)
      s3                       = optional(string)
      s3control                = optional(string)
      s3outposts               = optional(string)
      sagemaker                = optional(string)
      schemas                  = optional(string)
      sdb                      = optional(string)
      secretsmanager           = optional(string)
      securityhub              = optional(string)
      serverlessrepo           = optional(string)
      servicecatalog           = optional(string)
      servicediscovery         = optional(string)
      servicequotas            = optional(string)
      ses                      = optional(string)
      shield                   = optional(string)
      signer                   = optional(string)
      sns                      = optional(string)
      sqs                      = optional(string)
      ssm                      = optional(string)
      ssoadmin                 = optional(string)
      stepfunctions            = optional(string)
      storagegateway           = optional(string)
      sts                      = optional(string)
      swf                      = optional(string)
      synthetics               = optional(string)
      timestreamwrite          = optional(string)
      transfer                 = optional(string)
      waf                      = optional(string)
      wafregional              = optional(string)
      wafv2                    = optional(string)
      worklink                 = optional(string)
      workmail                 = optional(string)
      workspaces               = optional(string)
      xray                     = optional(string)
    }))
    shared_credentials_file = optional(string)
    token                   = optional(string)
    max_retries             = optional(number)
    allowed_account_ids     = optional(list(number))
    forbidden_account_ids   = optional(list(number))
    default_tags = optional(object({
      tags = optional(map(string))
    }))
    ignore_tags = optional(object({
      keys         = optional(list(string))
      key_prefixes = optional(list(string))
    }))
    insecure                    = optional(bool)
    skip_credentials_validation = optional(bool)
    skip_get_ec2_platforms      = optional(bool)
    skip_region_validation      = optional(bool)
    skip_requesting_account_id  = optional(bool)
    skip_metadata_api_check     = optional(bool)
    s3_force_path_style         = optional(bool)
  })
}

variable "bucket_regions" {
  description = "A map of key/value string pairs, where keys are unique IDs for buckets (only for Terraform internal use, not used in the AWS config) and values are the regions of the buckets. This is separate from the `buckets` input parameter so that the main bucket parameters can be dynamically set, whereas this input parameter must be definable during the plan step."
  type        = map(string)
}

variable "bucket_configs" {
  description = "A map of configuration objects for each bucket, where the keys MUST match the keys in the `bucket_regions` input parameter."
  type = map(object({
    bucket = string
    acl    = optional(string)
    grants = optional(list(object({
      id          = optional(string)
      type        = string
      permissions = list(string)
      uri         = optional(string)
    })))
    tags          = optional(map(string))
    force_destroy = optional(bool)
    website = optional(object({
      index_document           = optional(string)
      error_document           = optional(string)
      redirect_all_requests_to = optional(string)
      routing_rules            = optional(string)
    }))
    cors_rules = optional(list(object({
      allowed_headers = optional(list(string))
      allowed_methods = list(string)
      allowed_origins = list(string)
      expose_headers  = optional(list(string))
      max_age_seconds = optional(number)
    })))
    versioning = optional(object({
      enabled    = optional(bool)
      mfa_delete = optional(bool)
    }))
    logging = optional(object({
      target_bucket = bool
      target_prefix = optional(string)
    }))
    lifecycle_rules = optional(list(object({
      id                                     = optional(string)
      prefix                                 = optional(string)
      tags                                   = optional(map(string))
      enabled                                = bool
      abort_incomplete_multipart_upload_days = optional(number)
      expiration = optional(object({
        date                         = optional(string)
        days                         = optional(number)
        expired_object_delete_marker = optional(bool)
      }))
      transitions = optional(list(object({
        date          = optional(string)
        days          = optional(number)
        storage_class = string
      })))
      noncurrent_version_expiration = optional(object({
        days = number
      }))
      noncurrent_version_transitions = optional(list(object({
        days          = number
        storage_class = string
      })))
    })))
    acceleration_status = optional(string)
    request_payer       = optional(string)
    replication_configuration = optional(object({
      role = optional(string)
      rules = list(object({
        id       = optional(string)
        priority = optional(number)
        destination = object({
          bucket             = optional(string)
          module_bucket_key  = optional(string)
          storage_class      = optional(string)
          replica_kms_key_id = optional(string)
          access_control_translation = optional(object({
            owner = string
          }))
          account_id = optional(string)
          replication_time = optional(object({
            enabled = bool
            time = object({
              minutes = number
            })
          }))
          metrics = optional(object({
            enabled = bool
            event_threshold = optional(object({
              minutes = number
            }))
          }))
        })
        source_selection_criteria = optional(object({
          sse_kms_encrypted_objects = optional(object({
            enabled = bool
          }))
          replica_modifications = optional(object({
            enabled = bool
          }))
        }))
        existing_object_replication = optional(object({
          enabled = bool
        }))
        delete_marker_replication = optional(object({
          enabled = bool
        }))
        prefix = optional(string)
        status = string
        filter = optional(object({
          prefix = optional(string)
          tags   = optional(map(string))
        }))
      }))
    }))
    server_side_encryption_configuration = optional(object({
      rule = object({
        apply_server_side_encryption_by_default = object({
          sse_algorithm     = string
          kms_master_key_id = optional(string)
        })
        bucket_key_enabled = optional(bool)
      })
    }))
    object_lock_configuration = optional(object({
      object_lock_enabled = bool
      rule = optional(object({
        default_retention = object({
          mode  = string
          days  = optional(number)
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
      block_public_acls       = optional(bool)
      block_public_policy     = optional(bool)
      ignore_public_acls      = optional(bool)
      restrict_public_buckets = optional(bool)
    }))
    // Whether to prefer the bucket owner for object ownership (defaults to true)
    prefer_bucket_owner = optional(bool)
  }))
}
