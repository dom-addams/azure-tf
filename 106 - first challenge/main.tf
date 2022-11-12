resource "azurerm_virtual_network" "main" {
  name                = "my-challenge-network"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"
  address_space       = ["10.5.0.0/16"]
}

resource "azurerm_subnet" "internal" {
  name                 = "internal-resources"
  resource_group_name  = "terraform-resources-rg"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.5.0.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "challenge-nic"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}