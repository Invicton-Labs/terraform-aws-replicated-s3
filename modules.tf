locals {
    bucket_limit = 3
    bucket_modules = [
        module.bucket_0,
        module.bucket_1,
        module.bucket_2,
    ]
    replication_roles = [
        length(var.buckets) > 0 ? module.bucket_0.replication_role : null,
        length(var.buckets) > 1 ? module.bucket_1.replication_role : null,
        length(var.buckets) > 2 ? module.bucket_2.replication_role : null,
    ]
}

module "bucket_0" {
    source = "./bucket"
    create = length(var.buckets) > 0
    providers = {
        aws = aws.bucket_0
    }
    bucket_config = length(var.buckets) > 0 ? var.buckets[0] : null
    replication_destination_arns = length(var.buckets) > 0 ? local.replication_destination_arns[0] : []
    replication_source_arns = length(var.buckets) > 0 ? local.replication_source_arns[0] : []
    replication_source_role_arns = length(var.buckets) > 0 ? local.replication_source_role_arns[0] : []
}
module "bucket_1" {
    source = "./bucket"
    create = length(var.buckets) > 1
    providers = {
        aws = aws.bucket_1
    }
    bucket_config = length(var.buckets) > 1 ? var.buckets[1] : null
    replication_destination_arns = length(var.buckets) > 1 ? local.replication_destination_arns[1] : []
    replication_source_arns = length(var.buckets) > 1 ? local.replication_source_arns[1] : []
    replication_source_role_arns = length(var.buckets) > 1 ? local.replication_source_role_arns[1] : []
}
module "bucket_2" {
    source = "./bucket"
    create = length(var.buckets) > 2
    providers = {
        aws = aws.bucket_2
    }
    bucket_config = length(var.buckets) > 2 ? var.buckets[2] : null
    replication_destination_arns = length(var.buckets) > 2 ? local.replication_destination_arns[2] : []
    replication_source_arns = length(var.buckets) > 2 ? local.replication_source_arns[2] : []
    replication_source_role_arns = length(var.buckets) > 2 ? local.replication_source_role_arns[2] : []
}
