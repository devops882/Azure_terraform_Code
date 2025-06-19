output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "The auto-generated storage account name"
}

output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "The resource ID of the storage account"
}

output "resource_group_used" {
  value       = azurerm_resource_group.rg.name
  description = "The resource group name used"
}
