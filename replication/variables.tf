variable "bucket_config" {
  type = any
}
variable "bucket_arns" {
  type = map(string)
}
variable "bucket_id" {
  type = string
}
variable "replication_role_arn" {
  type = string
}
