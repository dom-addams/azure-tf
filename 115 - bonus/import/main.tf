# Provider
provider "azurerm" {
  version = "2.38.0"
  features {}
}

resource "azurerm_resource_group" "resource_groups" {
  name     = "new-resources-rg"
  location = "UK South"
}

# Part 2 -- import existing
resource "azurerm_resource_group" "tf_rg" {
  name     = "terraform-resources-rg"
  location = "UK South"
}

// terraform import azurerm_resource_group.tf_rg /subscriptions/11794cc4-3bda-42e0-b5ef-86356d008ba3/resourceGroups/terraform-resources-rg