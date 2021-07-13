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
        aws_iam_role.replication_0,
        aws_iam_role.replication_1,
        aws_iam_role.replication_2,
    ]
}

// A role for the S3 buckets to use to do cross-region replication
resource "aws_iam_role" "replication_0" {
    provider = aws.bucket_0
    // Only create the role if the bucket has any replication destinations
    count = length(var.buckets) > 0 ? (length(local.replication_destination_arns[0]) > 0 ? 1 : 0) : 0
  name_prefix        = "${local.shortened_role_name_prefixes[0]}-"
  path               = "/s3-replication/"
  assume_role_policy = local.assume_role_policy
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "replication_0" {
  provider = aws.bucket_0
  count = length(aws_iam_role.replication_0)
  role     = aws_iam_role.replication_0[count.index].name
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
                  aws_s3_bucket.bucket_0[0].arn
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
                "${aws_s3_bucket.bucket_0[0].arn}/*"
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
                  for arn in local.replication_destination_arns[0]:
                  "${arn}/*"
              ]
          },
      ]
  })
  lifecycle {
    create_before_destroy = true
  }
}
// A role for the S3 buckets to use to do cross-region replication
resource "aws_iam_role" "replication_1" {
    provider = aws.bucket_1
    // Only create the role if the bucket has any replication destinations
    count = length(var.buckets) > 1 ? (length(local.replication_destination_arns[1]) > 0 ? 1 : 0) : 0
  name_prefix        = "${local.shortened_role_name_prefixes[1]}-"
  path               = "/s3-replication/"
  assume_role_policy = local.assume_role_policy
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "replication_1" {
  provider = aws.bucket_1
  count = length(aws_iam_role.replication_1)
  role     = aws_iam_role.replication_1[count.index].name
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
                  aws_s3_bucket.bucket_1[0].arn
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
                "${aws_s3_bucket.bucket_1[0].arn}/*"
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
                  for arn in local.replication_destination_arns[1]:
                  "${arn}/*"
              ]
          },
      ]
  })
  lifecycle {
    create_before_destroy = true
  }
}
// A role for the S3 buckets to use to do cross-region replication
resource "aws_iam_role" "replication_2" {
    provider = aws.bucket_2
    // Only create the role if the bucket has any replication destinations
    count = length(var.buckets) > 2 ? (length(local.replication_destination_arns[2]) > 0 ? 1 : 0) : 0
  name_prefix        = "${local.shortened_role_name_prefixes[2]}-"
  path               = "/s3-replication/"
  assume_role_policy = local.assume_role_policy
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "replication_2" {
  provider = aws.bucket_2
  count = length(aws_iam_role.replication_2)
  role     = aws_iam_role.replication_2[count.index].name
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
                  aws_s3_bucket.bucket_2[0].arn
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
                "${aws_s3_bucket.bucket_2[0].arn}/*"
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
                  for arn in local.replication_destination_arns[2]:
                  "${arn}/*"
              ]
          },
      ]
  })
  lifecycle {
    create_before_destroy = true
  }
}
