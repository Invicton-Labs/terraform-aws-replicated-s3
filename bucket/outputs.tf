output "replication_role" {
    value = length(aws_iam_role.replication) > 0 ? aws_iam_role.replication[0] : null
}