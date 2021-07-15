variable "bucket_config" {
    type = any
}
variable "replication_destination_arns" {
    type = list(string)
}
variable "replication_source_arns" {
    type = list(string)
}
variable "replication_source_role_arns" {
    type = list(string)
}
variable "bucket_arns" {
    type = list(string)
}
variable "create" {
    type = bool
}