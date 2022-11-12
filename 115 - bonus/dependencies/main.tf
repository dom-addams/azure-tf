# Provider
provider "azurerm" {
  version = "2.38.0"
  features {}
}

resource "azurerm_resource_group" "dependencies" {
  name = "dependencies-rg"
  location = "UK South"
}

resource "azurerm_virtual_network" "main_network" {
  name                = "my-dependant-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "UK South"
  resource_group_name = "dependencies-rg"

  # Explicit dependency
  depends_on = [
    azurerm_resource_group.dependencies
  ]
}

resource "azurerm_subnet" "first" {
  name                 = "first-subnet"
  resource_group_name  = "dependencies-rg"
  address_prefixes     = ["10.0.2.0/24"]

  # Implicit depedency
  virtual_network_name = azurerm_virtual_network.main_network.name
}
