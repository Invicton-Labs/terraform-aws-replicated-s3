locals {
    canonical_ids = [
%{ for idx in range(num_buckets) ~}
        data.aws_canonical_user_id.account_${idx}.id,
%{ endfor ~}
    ]
}

%{ for idx in range(num_buckets) ~}
// Get the canonical user ID
data "aws_canonical_user_id" "account_${idx}" {
    provider = aws.bucket_${idx}
}

%{ endfor ~}
