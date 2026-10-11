resource "databricks_mws_network_connectivity_config" "mws_network_connectivity_configs" {
  for_each = var.mws_network_connectivity_configs

  name                           = each.value.name
  region                         = each.value.region
  account_id                     = each.value.account_id
  creation_time                  = each.value.creation_time
  network_connectivity_config_id = each.value.network_connectivity_config_id
  updated_time                   = each.value.updated_time

  dynamic "egress_config" {
    for_each = each.value.egress_config != null ? [each.value.egress_config] : []
    content {
      dynamic "default_rules" {
        for_each = egress_config.value.default_rules != null ? [egress_config.value.default_rules] : []
        content {
          dynamic "aws_stable_ip_rule" {
            for_each = default_rules.value.aws_stable_ip_rule != null ? [default_rules.value.aws_stable_ip_rule] : []
            content {
              cidr_blocks = aws_stable_ip_rule.value.cidr_blocks
            }
          }
          dynamic "azure_service_endpoint_rule" {
            for_each = default_rules.value.azure_service_endpoint_rule != null ? [default_rules.value.azure_service_endpoint_rule] : []
            content {
              subnets         = azure_service_endpoint_rule.value.subnets
              target_region   = azure_service_endpoint_rule.value.target_region
              target_services = azure_service_endpoint_rule.value.target_services
            }
          }
        }
      }
      dynamic "target_rules" {
        for_each = egress_config.value.target_rules != null ? [egress_config.value.target_rules] : []
        content {
          dynamic "aws_private_endpoint_rules" {
            for_each = target_rules.value.aws_private_endpoint_rules != null ? target_rules.value.aws_private_endpoint_rules : []
            content {
              account_id                     = aws_private_endpoint_rules.value.account_id
              connection_state               = aws_private_endpoint_rules.value.connection_state
              creation_time                  = aws_private_endpoint_rules.value.creation_time
              deactivated                    = aws_private_endpoint_rules.value.deactivated
              deactivated_at                 = aws_private_endpoint_rules.value.deactivated_at
              domain_names                   = aws_private_endpoint_rules.value.domain_names
              enabled                        = aws_private_endpoint_rules.value.enabled
              endpoint_service               = aws_private_endpoint_rules.value.endpoint_service
              error_message                  = aws_private_endpoint_rules.value.error_message
              network_connectivity_config_id = aws_private_endpoint_rules.value.network_connectivity_config_id
              resource_names                 = aws_private_endpoint_rules.value.resource_names
              rule_id                        = aws_private_endpoint_rules.value.rule_id
              updated_time                   = aws_private_endpoint_rules.value.updated_time
              vpc_endpoint_id                = aws_private_endpoint_rules.value.vpc_endpoint_id
            }
          }
          dynamic "azure_private_endpoint_rules" {
            for_each = target_rules.value.azure_private_endpoint_rules != null ? target_rules.value.azure_private_endpoint_rules : []
            content {
              connection_state               = azure_private_endpoint_rules.value.connection_state
              creation_time                  = azure_private_endpoint_rules.value.creation_time
              deactivated                    = azure_private_endpoint_rules.value.deactivated
              deactivated_at                 = azure_private_endpoint_rules.value.deactivated_at
              domain_names                   = azure_private_endpoint_rules.value.domain_names
              endpoint_name                  = azure_private_endpoint_rules.value.endpoint_name
              error_message                  = azure_private_endpoint_rules.value.error_message
              group_id                       = azure_private_endpoint_rules.value.group_id
              network_connectivity_config_id = azure_private_endpoint_rules.value.network_connectivity_config_id
              resource_id                    = azure_private_endpoint_rules.value.resource_id
              rule_id                        = azure_private_endpoint_rules.value.rule_id
              updated_time                   = azure_private_endpoint_rules.value.updated_time
            }
          }
        }
      }
    }
  }
}

