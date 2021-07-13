variable "bucket_config" {
    type = object(any)
}
variable "replication_destination_arns" {
    type = list(string)
}
variable "replication_source_role_arns" {
    type = list(string)
}
