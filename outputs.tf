output "mws_network_connectivity_configs_id" {
  description = "Map of id values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no id are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "mws_network_connectivity_configs_account_id" {
  description = "Map of account_id values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no account_id are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => v.account_id if v.account_id != null && length(v.account_id) > 0 }
}
output "mws_network_connectivity_configs_creation_time" {
  description = "Map of creation_time values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no creation_time are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => v.creation_time if v.creation_time != null }
}
output "mws_network_connectivity_configs_egress_config" {
  description = "Map of egress_config values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no egress_config are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => one(v.egress_config) if v.egress_config != null && length(v.egress_config) > 0 }
}
output "mws_network_connectivity_configs_name" {
  description = "Map of name values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no name are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "mws_network_connectivity_configs_network_connectivity_config_id" {
  description = "Map of network_connectivity_config_id values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no network_connectivity_config_id are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => v.network_connectivity_config_id if v.network_connectivity_config_id != null && length(v.network_connectivity_config_id) > 0 }
}
output "mws_network_connectivity_configs_region" {
  description = "Map of region values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no region are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => v.region if v.region != null && length(v.region) > 0 }
}
output "mws_network_connectivity_configs_updated_time" {
  description = "Map of updated_time values across all mws_network_connectivity_configs, keyed the same as var.mws_network_connectivity_configs except keys with no updated_time are omitted"
  value       = { for k, v in databricks_mws_network_connectivity_config.mws_network_connectivity_configs : k => v.updated_time if v.updated_time != null }
}

