output "storage_account_name" {
  value = module.storage.storage_name
}

output "storage_account_names" {
  description = "Names of all storage accounts created with count loop"
  value       = azurerm_storage_account.loop_storage[*].name
}

output "storage_account_names_map" {
  description = "Names of all storage accounts created with for_each loop"
  value       = [for s in azurerm_storage_account.for_each_storage : s.name]
}

output "resource_group_id" {
  description = "ID of the imported/existing resource group"
  value       = data.azurerm_resource_group.existing.id
}
