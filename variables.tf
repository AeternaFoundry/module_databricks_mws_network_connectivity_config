variable "mws_network_connectivity_configs" {
  description = <<EOT
Map of mws_network_connectivity_configs, attributes below
Required:
    - name
    - region
Optional:
    - account_id
    - creation_time
    - network_connectivity_config_id
    - updated_time
    - egress_config (block):
        - default_rules (optional, block):
            - aws_stable_ip_rule (optional, block):
                - cidr_blocks (optional)
            - azure_service_endpoint_rule (optional, block):
                - subnets (optional)
                - target_region (optional)
                - target_services (optional)
        - target_rules (optional, block):
            - aws_private_endpoint_rules (optional, block):
                - account_id (optional)
                - connection_state (optional)
                - creation_time (optional)
                - deactivated (optional)
                - deactivated_at (optional)
                - domain_names (optional)
                - enabled (optional)
                - endpoint_service (optional)
                - error_message (optional)
                - network_connectivity_config_id (optional)
                - resource_names (optional)
                - rule_id (optional)
                - updated_time (optional)
                - vpc_endpoint_id (optional)
            - azure_private_endpoint_rules (optional, block):
                - connection_state (optional)
                - creation_time (optional)
                - deactivated (optional)
                - deactivated_at (optional)
                - domain_names (optional)
                - endpoint_name (optional)
                - error_message (optional)
                - group_id (optional)
                - network_connectivity_config_id (optional)
                - resource_id (optional)
                - rule_id (optional)
                - updated_time (optional)
EOT

  type = map(object({
    name                           = string
    region                         = string
    account_id                     = optional(string)
    creation_time                  = optional(number)
    network_connectivity_config_id = optional(string)
    updated_time                   = optional(number)
    egress_config = optional(object({
      default_rules = optional(object({
        aws_stable_ip_rule = optional(object({
          cidr_blocks = optional(list(string))
        }))
        azure_service_endpoint_rule = optional(object({
          subnets         = optional(list(string))
          target_region   = optional(string)
          target_services = optional(list(string))
        }))
      }))
      target_rules = optional(object({
        aws_private_endpoint_rules = optional(list(object({
          account_id                     = optional(string)
          connection_state               = optional(string)
          creation_time                  = optional(number)
          deactivated                    = optional(bool)
          deactivated_at                 = optional(number)
          domain_names                   = optional(list(string))
          enabled                        = optional(bool)
          endpoint_service               = optional(string)
          error_message                  = optional(string)
          network_connectivity_config_id = optional(string)
          resource_names                 = optional(list(string))
          rule_id                        = optional(string)
          updated_time                   = optional(number)
          vpc_endpoint_id                = optional(string)
        })))
        azure_private_endpoint_rules = optional(list(object({
          connection_state               = optional(string)
          creation_time                  = optional(number)
          deactivated                    = optional(bool)
          deactivated_at                 = optional(number)
          domain_names                   = optional(list(string))
          endpoint_name                  = optional(string)
          error_message                  = optional(string)
          group_id                       = optional(string)
          network_connectivity_config_id = optional(string)
          resource_id                    = optional(string)
          rule_id                        = optional(string)
          updated_time                   = optional(number)
        })))
      }))
    }))
  }))
}

