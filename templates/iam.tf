locals {
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
            Effect = "Allow"
            Action = "sts:AssumeRole"
            Principal = {
                Service = "s3.amazonaws.com"
            }
        }
      ]
    })
    replication_roles = [
%{ for idx in range(num_buckets) ~}
        aws_iam_role.replication_${idx},
%{ endfor ~}
    ]
}

%{ for idx in range(num_buckets) ~}
// A role for the S3 buckets to use to do cross-region replication
resource "aws_iam_role" "replication_${idx}" {
    provider = aws.bucket_${idx}
    // Only create the role if the bucket has any replication destinations
    count = length(var.buckets) > ${idx} ? (length(local.replication_destination_arns[${idx}]) > 0 ? 1 : 0) : 0
  name_prefix        = "$${local.shortened_role_name_prefixes[${idx}]}-"
  path               = "/s3-replication/"
  assume_role_policy = local.assume_role_policy
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "replication_${idx}" {
  provider = aws.bucket_${idx}
  count = length(aws_iam_role.replication_${idx})
  role     = aws_iam_role.replication_${idx}[count.index].name
  policy   = jsonencode({
      Version = "2012-10-17"
      Statement = [
          // Allow listing and getting object data FROM the source ARN
          {
              Effect = "Allow"
              Action = [
                "s3:ListBucket",
                "s3:GetReplicationConfiguration"
              ]
              Resource = [
                  aws_s3_bucket.bucket_${idx}[0].arn
              ]
          },
          {
              Effect = "Allow"
              Action = [
                "s3:GetObjectVersionForReplication",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectVersionTagging"
              ]
              Resource = [
                "$${aws_s3_bucket.bucket_${idx}[0].arn}/*"
              ]
          },
          // Allow replicating INTO each destination ARN
          {
              Effect = "Allow"
              Action = [
                "s3:ReplicateObject",
                "s3:ReplicateDelete",
                "s3:ReplicateTags"
              ]
              Resource = [
                  for arn in local.replication_destination_arns[${idx}]:
                  "$${arn}/*"
              ]
          },
      ]
  })
  lifecycle {
    create_before_destroy = true
  }
}
%{ endfor ~}
