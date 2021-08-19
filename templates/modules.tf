/*
CREATED BY A TEMPLATE
DO NOT EDIT MANUALLY
*/

locals {
    region_bucket_modules = {
%{ for region in regions ~}
        ${region} = module.buckets_${region},
%{ endfor ~}       
    }
    
    region_replication_modules = {
%{ for region in regions ~}
        ${region} = module.replications_${region},
%{ endfor ~}       
    }
}

%{ for region in regions ~}
module "buckets_${region}" {
    source = "./bucket"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "${region}"
    }
    providers = {
        aws = aws.${region}
    }
    bucket_config = var.bucket_configs[each.key]
    replication_destination_arns = local.replication_destination_arns[each.key]
    replication_source_arns = local.replication_source_arns[each.key]
}

module "replications_${region}" {
    source = "./replication"
    for_each = {
        for k, v in var.bucket_regions:
        k => v
        if v == "${region}"
    }
    providers = {
        aws = aws.${region}
    }
    bucket_config = var.bucket_configs[each.key]
    replication_role_arn = local.bucket_modules[each.key].replication_role.arn
    bucket_id = local.bucket_modules[each.key].bucket.id
    bucket_arns = local.bucket_arns
}

%{ endfor ~}