locals {
    bucket_limit = ${num_buckets}
    bucket_modules = [
%{ for idx in range(num_buckets) ~}
        module.bucket_${idx},
%{ endfor ~}       
    ]
    replication_roles = [
%{ for idx in range(num_buckets) ~}
        length(var.buckets) > ${idx} ? module.bucket_${idx}.replication_role : null,
%{ endfor ~}       
    ]
}

%{ for idx in range(num_buckets) ~}
module "bucket_${idx}" {
    source = "./bucket"
    create = length(var.buckets) > ${idx}
    providers = {
        aws = aws.bucket_${idx}
    }
    bucket_config = length(var.buckets) > ${idx} ? var.buckets[${idx}] : null
    replication_destination_arns = length(var.buckets) > ${idx} ? local.replication_destination_arns[${idx}] : []
    replication_source_arns = length(var.buckets) > ${idx} ? local.replication_source_arns[${idx}] : []
    replication_source_role_arns = length(var.buckets) > ${idx} ? local.replication_source_role_arns[${idx}] : []
}
%{ endfor ~}