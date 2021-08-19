output "replication_output" {
  value = jsonencode(local.replication_config) // module.set_replication_config
}
