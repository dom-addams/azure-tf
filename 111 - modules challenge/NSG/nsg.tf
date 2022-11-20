resource "azurerm_network_security_group" "nsg_resource" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg
}

output "nsg_name_output" {
  value = azurerm_network_security_group.nsg_resource.name
}