resource "azurerm_virtual_network" "advanced_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg
  address_space       = var.vnet_range
}

resource "azurerm_subnet" "public" {
  name                 = var.public_subnet_name
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.advanced_vnet.name
  address_prefixes     = var.public_subnet_range
}

resource "azurerm_network_interface" "advanced_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = var.allocation
}
