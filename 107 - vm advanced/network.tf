resource "azurerm_virtual_network" "advanced_vnet" {
  name                = "advanced_vnet"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"
  address_space       = ["10.5.0.0/16"]
}

resource "azurerm_subnet" "public" {
  name                 = "public-resources"
  resource_group_name  = "terraform-resources-rg"
  virtual_network_name = azurerm_virtual_network.advanced_vnet.name
  address_prefixes     = ["10.5.0.0/24"]
}

resource "azurerm_network_interface" "advanced_nic" {
  name                = "advc-windows-vm-nic"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "public-ip"
  resource_group_name = "terraform-resources-rg"
  location            = "UK South"
  allocation_method   = "Dynamic"
}
