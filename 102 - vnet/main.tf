resource "azurerm_virtual_network" "main" {
  name                = "my-virtual-network"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal-resources"
  resource_group_name  = "terraform-resources-rg"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}