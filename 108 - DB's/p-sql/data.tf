data "azurerm_subnet" "data_subnet" {
  name                 = "internal-resources"
  virtual_network_name = "my-virtual-network"
  resource_group_name  = "terraform-resources-rg"
}
