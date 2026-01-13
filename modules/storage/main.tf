# modules/storage/main.tf
resource "azurerm_storage_account" "this" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "storage_name" {
  value = azurerm_storage_account.this.name
}
