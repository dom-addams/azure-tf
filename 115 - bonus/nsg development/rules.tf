# NSG Rules seperately defined in list format

# Example - Cassandra
# [direction, access, protocol, source_port_range, destination_port_range, description]"
# The following info are in the submodules: source_address_prefix, destination_address_prefix
# Cassandra = ["Inbound", "Allow", "TCP", "*", "9042", "Cassandra"]

variable "rules" {
  description = "SG rules seperately defined in lists"
  type        = map(any)
  default = {
# protocol = [name, priority, direction, access, protocol, source_port, destination_port, source_ip, destination_ip]
    http  = ["allow-http", "110", "Inbound", "Allow", "TCP", "*", "80", "*", "*"]
    https = ["allow-https", "120", "Inbound", "Allow", "TCP", "*", "443", "*", "*"]
    rdp   = ["allow-https", "130", "Inbound", "Allow", "TCP", "*", "3386", "*", "*"]
  }
}

# https://registry.terraform.io/modules/Azure/network-security-group/azurerm/latest
# https://github.com/Azure/terraform-azurerm-network-security-group/blob/master/variables.tf
# https://github.com/Azure/terraform-azurerm-network-security-group/blob/master/main.tf
# https://github.com/Azure/terraform-azurerm-network-security-group/blob/master/rules.tf
# https://github.com/hashicorp/terraform-guides/tree/master/infrastructure-as-code/terraform-0.12-examples/advanced-dynamic-blocks
# https://stackoverflow.com/questions/57503110/how-can-i-iterate-through-a-map-variable-in-terraform
