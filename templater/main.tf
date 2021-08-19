terraform {
  required_version = ">= 1.0.0"
}

locals {
  regions = [
    "af-south-1",
    "ap-east-1",
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-northeast-3",
    "ap-south-1",
    "ap-southeast-1",
    "ap-southeast-2",
    "ca-central-1",
    "eu-central-1",
    "eu-north-1",
    "eu-south-1",
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "me-south-1",
    "sa-east-1",
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2"
  ]
}

resource "local_file" "providers" {
  sensitive_content = templatefile("${path.module}/../templates/providers.tf", { regions = local.regions })
  filename          = "${path.module}/../providers.tf"
}
resource "local_file" "modules" {
  sensitive_content = templatefile("${path.module}/../templates/modules.tf", { regions = local.regions })
  filename          = "${path.module}/../modules.tf"
}
