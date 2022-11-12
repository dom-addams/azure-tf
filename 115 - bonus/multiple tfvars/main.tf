# Provider
provider "azurerm" {
  version = "2.38.0"
  features {}
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.myname
  address_space       = var.range //["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg
}

// Run with option -var-file="filename.tfvars"
# A .tfvars file is used to assign values to variables that have already been declared in .tf files, not to declare new variables.

// Declare Variables
variable "myname" {}
variable "range" {}
variable "location" {}
variable "rg" {}