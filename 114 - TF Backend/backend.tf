terraform {
  cloud {
      organization = "DMD-Development"
      workspaces {
          name = "terraform-resource"
      }
  }
}

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
  subscription_id = "11794cc4-3bda-42e0-b5ef-86356d008ba3"
  tenant_id = "a41d2b60-8f4c-4718-9186-26e07129e3ea"
}
