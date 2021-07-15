terraform {
  required_version = ">= 1.0.0"
}

resource "local_file" "providers" {
    sensitive_content     = templatefile("${path.module}/../templates/providers.tf", {num_buckets = var.num_buckets})
    filename = "${path.module}/../providers.tf"
}
resource "local_file" "modules" {
    sensitive_content     = templatefile("${path.module}/../templates/modules.tf", {num_buckets = var.num_buckets})
    filename = "${path.module}/../modules.tf"
}
