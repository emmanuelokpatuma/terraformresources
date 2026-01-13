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
  resource_group = data.azurerm_resource_group.existing.name   # Use data source for consistency
  location       = var.location
}


# ----------------------------
# Task 4: Use existing resource group via data source
# ----------------------------
data "azurerm_resource_group" "existing" {
  name = "azure_assignment"   # your RG where SP has access
}



# ----------------------------
# Task 3: Dynamic storage accounts using count
# ----------------------------
resource "azurerm_storage_account" "loop_storage" {
  count                     = length(var.storage_names)
  name                      = var.storage_names[count.index]   # storage name from variable list
  resource_group_name       = data.azurerm_resource_group.existing.name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"

  tags = {
    environment = "dev"
  }
}


# Using for_each
resource "azurerm_storage_account" "for_each_storage" {
  for_each                  = var.storages
  name                      = each.key
  resource_group_name       = data.azurerm_resource_group.existing.name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = each.value

  tags = {
    environment = "dev"
  }
}
