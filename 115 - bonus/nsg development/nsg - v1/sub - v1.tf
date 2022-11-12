resource "azurerm_network_security_group" "nsg_resource" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg

  dynamic "security_rule" {
    for_each = var.interator
    content {
      name                       = var.rule_name
      priority                   = var.rule_priorty
      direction                  = var.rule_direction
      access                     = var.rule_access
      protocol                   = var.rule_protocol
      source_port_range          = var.rule_source_port
      destination_port_range     = var.rule_destination_port
      source_address_prefix      = var.rule_source_ip
      destination_address_prefix = var.rule_destination_ip 
    }
  }
}
