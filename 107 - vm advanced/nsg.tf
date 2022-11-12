resource "azurerm_network_security_group" "advanced_nsg" {
  name                = "tf-advanced-nsg"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"
}

resource "azurerm_network_security_rule" "example_outbound" {
  name                        = "https-outbound"
  priority                    = 110
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "terraform-resources-rg"
  network_security_group_name = azurerm_network_security_group.advanced_nsg.name
}

resource "azurerm_network_security_rule" "example_inbound" {
  name                        = "https-inbound"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "terraform-resources-rg"
  network_security_group_name = azurerm_network_security_group.advanced_nsg.name
}

resource "azurerm_network_security_rule" "example_rdp_inbound" {
  name                        = "rdp-inbound"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 3389
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "terraform-resources-rg"
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
