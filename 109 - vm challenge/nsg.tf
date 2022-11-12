resource "azurerm_network_security_group" "advanced_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg
}

resource "azurerm_network_security_rule" "example_outbound" {
  name                        = var.https_out_rule_name
  priority                    = var.https_priority
  direction                   = var.direction_out
  access                      = var.traffic_allowed
  protocol                    = var.traffic_protocol
  source_port_range           = var.allow_all
  destination_port_range      = var.https_port
  source_address_prefix       = var.allow_all
  destination_address_prefix  = var.allow_all
  resource_group_name         = var.rg
  network_security_group_name = azurerm_network_security_group.advanced_nsg.name
}

resource "azurerm_network_security_rule" "example_inbound" {
  name                        = var.http_rule_name
  priority                    = var.http_priority
  direction                   = var.direction_in
  access                      = var.traffic_allowed
  protocol                    = var.traffic_protocol
  source_port_range           = var.allow_all
  destination_port_range      = var.http_port
  source_address_prefix       = var.allow_all
  destination_address_prefix  = var.allow_all
  resource_group_name         = var.rg
  network_security_group_name = azurerm_network_security_group.advanced_nsg.name
}

resource "azurerm_network_security_rule" "example_rdp_inbound" {
  name                        = var.rdp_rule_name
  priority                    = var.rdp_priority
  direction                   = var.direction_in
  access                      = var.traffic_allowed
  protocol                    = var.traffic_protocol
  source_port_range           = var.allow_all
  destination_port_range      = var.rdp_port
  source_address_prefix       = var.allow_all
  destination_address_prefix  = var.allow_all
  resource_group_name         = var.rg
  network_security_group_name = azurerm_network_security_group.advanced_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "subnet_associate" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.advanced_nsg.id
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.advanced_nic.id
  network_security_group_id = azurerm_network_security_group.advanced_nsg.id
}
