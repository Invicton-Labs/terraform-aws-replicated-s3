output "bucket" {
  value = aws_s3_bucket.bucket
}
output "replication_role" {
  value = length(aws_iam_role.replication) > 0 ? aws_iam_role.replication[0] : null
}
output "complete" {
  description = "A flag for determining when everything in this module has been created."
  depends_on = [
    aws_iam_role_policy.replication,
    aws_s3_bucket.bucket,
    aws_s3_bucket_public_access_block.bucket,
    aws_s3_bucket_ownership_controls.bucket,
  ]
  value = true
}
