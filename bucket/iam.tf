// A role for the S3 buckets to use to do cross-region replication
resource "aws_iam_role" "replication" {
    // Only create the role if the bucket has any replication destinations
    count = length(var.replication_destination_arns) > 0 ? 1 : 0
  name_prefix        = "${local.shortened_role_name_prefix}-"
  path               = "/s3-replication/"
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
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "replication" {
  count = length(aws_iam_role.replication)
  role     = aws_iam_role.replication[count.index].name
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
                  aws_s3_bucket.bucket.arn
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
                "${aws_s3_bucket.bucket.arn}/*"
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
                  for arn in var.replication_destination_arns:
                  "${arn}/*"
              ]
          },
      ]
  })
  lifecycle {
    create_before_destroy = true
  }
}
