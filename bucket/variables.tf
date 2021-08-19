variable "bucket_config" {
  type = any
}
variable "replication_destination_arns" {
  type = list(string)
}
variable "replication_source_arns" {
  type = list(string)
}
