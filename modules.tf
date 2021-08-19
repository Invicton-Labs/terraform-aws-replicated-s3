/*
CREATED BY A TEMPLATE
DO NOT EDIT MANUALLY
*/

locals {
    region_bucket_modules = {
        af-south-1 = module.buckets_af-south-1,
        ap-east-1 = module.buckets_ap-east-1,
        ap-northeast-1 = module.buckets_ap-northeast-1,
        ap-northeast-2 = module.buckets_ap-northeast-2,
        ap-northeast-3 = module.buckets_ap-northeast-3,
        ap-south-1 = module.buckets_ap-south-1,
        ap-southeast-1 = module.buckets_ap-southeast-1,
        ap-southeast-2 = module.buckets_ap-southeast-2,
        ca-central-1 = module.buckets_ca-central-1,
        eu-central-1 = module.buckets_eu-central-1,
        eu-north-1 = module.buckets_eu-north-1,
        eu-south-1 = module.buckets_eu-south-1,
        eu-west-1 = module.buckets_eu-west-1,
        eu-west-2 = module.buckets_eu-west-2,
        eu-west-3 = module.buckets_eu-west-3,
        me-south-1 = module.buckets_me-south-1,
        sa-east-1 = module.buckets_sa-east-1,
        us-east-1 = module.buckets_us-east-1,
        us-east-2 = module.buckets_us-east-2,
        us-west-1 = module.buckets_us-west-1,
        us-west-2 = module.buckets_us-west-2,
    }
    
    region_replication_modules = {
        af-south-1 = module.replications_af-south-1,
        ap-east-1 = module.replications_ap-east-1,
        ap-northeast-1 = module.replications_ap-northeast-1,
        ap-northeast-2 = module.replications_ap-northeast-2,
        ap-northeast-3 = module.replications_ap-northeast-3,
        ap-south-1 = module.replications_ap-south-1,
        ap-southeast-1 = module.replications_ap-southeast-1,
        ap-southeast-2 = module.replications_ap-southeast-2,
        ca-central-1 = module.replications_ca-central-1,
        eu-central-1 = module.replications_eu-central-1,
        eu-north-1 = module.replications_eu-north-1,
        eu-south-1 = module.replications_eu-south-1,
        eu-west-1 = module.replications_eu-west-1,
        eu-west-2 = module.replications_eu-west-2,
        eu-west-3 = module.replications_eu-west-3,
        me-south-1 = module.replications_me-south-1,
        sa-east-1 = module.replications_sa-east-1,
        us-east-1 = module.replications_us-east-1,
        us-east-2 = module.replications_us-east-2,
        us-west-1 = module.replications_us-west-1,
        us-west-2 = module.replications_us-west-2,
    }
}

module "buckets_af-south-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "af-south-1"
    }
    providers = {
        aws = aws.af-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_af-south-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "af-south-1"
    }
    providers = {
        aws = aws.af-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ap-east-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-east-1"
    }
    providers = {
        aws = aws.ap-east-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ap-east-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-east-1"
    }
    providers = {
        aws = aws.ap-east-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ap-northeast-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-northeast-1"
    }
    providers = {
        aws = aws.ap-northeast-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ap-northeast-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-northeast-1"
    }
    providers = {
        aws = aws.ap-northeast-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ap-northeast-2" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-northeast-2"
    }
    providers = {
        aws = aws.ap-northeast-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ap-northeast-2" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-northeast-2"
    }
    providers = {
        aws = aws.ap-northeast-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ap-northeast-3" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-northeast-3"
    }
    providers = {
        aws = aws.ap-northeast-3
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ap-northeast-3" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-northeast-3"
    }
    providers = {
        aws = aws.ap-northeast-3
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ap-south-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-south-1"
    }
    providers = {
        aws = aws.ap-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ap-south-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-south-1"
    }
    providers = {
        aws = aws.ap-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ap-southeast-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-southeast-1"
    }
    providers = {
        aws = aws.ap-southeast-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ap-southeast-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-southeast-1"
    }
    providers = {
        aws = aws.ap-southeast-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ap-southeast-2" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-southeast-2"
    }
    providers = {
        aws = aws.ap-southeast-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ap-southeast-2" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ap-southeast-2"
    }
    providers = {
        aws = aws.ap-southeast-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_ca-central-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ca-central-1"
    }
    providers = {
        aws = aws.ca-central-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_ca-central-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "ca-central-1"
    }
    providers = {
        aws = aws.ca-central-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_eu-central-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-central-1"
    }
    providers = {
        aws = aws.eu-central-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_eu-central-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-central-1"
    }
    providers = {
        aws = aws.eu-central-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_eu-north-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-north-1"
    }
    providers = {
        aws = aws.eu-north-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_eu-north-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-north-1"
    }
    providers = {
        aws = aws.eu-north-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_eu-south-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-south-1"
    }
    providers = {
        aws = aws.eu-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_eu-south-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-south-1"
    }
    providers = {
        aws = aws.eu-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_eu-west-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-west-1"
    }
    providers = {
        aws = aws.eu-west-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_eu-west-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-west-1"
    }
    providers = {
        aws = aws.eu-west-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_eu-west-2" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-west-2"
    }
    providers = {
        aws = aws.eu-west-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_eu-west-2" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-west-2"
    }
    providers = {
        aws = aws.eu-west-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_eu-west-3" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-west-3"
    }
    providers = {
        aws = aws.eu-west-3
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_eu-west-3" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "eu-west-3"
    }
    providers = {
        aws = aws.eu-west-3
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_me-south-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "me-south-1"
    }
    providers = {
        aws = aws.me-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_me-south-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "me-south-1"
    }
    providers = {
        aws = aws.me-south-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_sa-east-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "sa-east-1"
    }
    providers = {
        aws = aws.sa-east-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_sa-east-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "sa-east-1"
    }
    providers = {
        aws = aws.sa-east-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_us-east-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-east-1"
    }
    providers = {
        aws = aws.us-east-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_us-east-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-east-1"
    }
    providers = {
        aws = aws.us-east-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_us-east-2" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-east-2"
    }
    providers = {
        aws = aws.us-east-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_us-east-2" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-east-2"
    }
    providers = {
        aws = aws.us-east-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_us-west-1" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-west-1"
    }
    providers = {
        aws = aws.us-west-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_us-west-1" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-west-1"
    }
    providers = {
        aws = aws.us-west-1
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

module "buckets_us-west-2" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-west-2"
    }
    providers = {
        aws = aws.us-west-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_us-west-2" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "us-west-2"
    }
    providers = {
        aws = aws.us-west-2
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

