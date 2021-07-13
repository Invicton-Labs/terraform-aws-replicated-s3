locals {
    canonical_ids = [
        data.aws_canonical_user_id.account_0.id,
        data.aws_canonical_user_id.account_1.id,
        data.aws_canonical_user_id.account_2.id,
    ]
}

// Get the canonical user ID
data "aws_canonical_user_id" "account_0" {
    provider = aws.bucket_0
}

// Get the canonical user ID
data "aws_canonical_user_id" "account_1" {
    provider = aws.bucket_1
}

// Get the canonical user ID
data "aws_canonical_user_id" "account_2" {
    provider = aws.bucket_2
}

