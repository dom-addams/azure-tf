terraform {
  cloud {
      organization = ""
      workspaces {
          name = ""
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
  subscription_id = ""
  tenant_id = ""
}
