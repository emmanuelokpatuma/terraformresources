terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }

  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "azure_assignment"
    storage_account_name = "eotfstate1234"
    container_name       = "terraformstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3a72be92-287b-4f1e-840a-5e3e71100139"  # your subscription ID
}

module "storage" {
  source         = "./modules/storage"
  storage_name   = "eostorage${terraform.workspace}"  
  resource_group = "azure_assignment"   # Same RG for all resources
  location       = "northeurope"
}

resource "azurerm_resource_group" "imported_rg" {
  # No arguments needed here, just declare the resource to import into
}
