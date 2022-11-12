# Provider
provider "azurerm" {
  version = "2.38.0"
  features {}
}

# Variable List with 3 rg names
variable "rg_names" {
  type    = list(string)
  default = ["first-rg", "second-rg", "third-rg"]
}

# Resource block with count 3 for each name
resource "azurerm_resource_group" "resource_groups" {
  count    = 3
  name     = var.rg_names[count.index]
  location = "UK South"
}
