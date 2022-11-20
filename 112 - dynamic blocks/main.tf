terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.38.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "my_vnet" {
  name                = "dynamic-network"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"
  address_space       = ["10.0.0.0/16"]

  dynamic "subnet" {
    for_each = var.my_subnets
    content {
      name           = subnet.value["sub_name"]
      address_prefix = subnet.value["address"]
    }
  }
}
