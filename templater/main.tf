terraform {
  required_version = ">= 1.0.0"
}

resource "local_file" "iam" {
    sensitive_content     = templatefile("${path.module}/../templates/iam.tf", {num_buckets = var.num_buckets})
    filename = "${path.module}/../iam.tf"
}
resource "local_file" "canonical" {
    sensitive_content     = templatefile("${path.module}/../templates/canonical.tf", {num_buckets = var.num_buckets})
    filename = "${path.module}/../canonical.tf"
}
resource "local_file" "s3" {
    sensitive_content     = templatefile("${path.module}/../templates/s3.tf", {num_buckets = var.num_buckets})
    filename = "${path.module}/../s3.tf"
}
