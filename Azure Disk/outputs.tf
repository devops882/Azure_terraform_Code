# outputs.tf

output "disk_id" {
  description = "The ID of the created Managed Disk"
  value       = azurerm_managed_disk.standard_hdd_disk.id
}

output "disk_name" {
  description = "The name of the created Managed Disk"
  value       = azurerm_managed_disk.standard_hdd_disk.name
}

output "disk_size" {
  description = "The size of the Managed Disk (in GiB)"
  value       = azurerm_managed_disk.standard_hdd_disk.disk_size_gb
}

output "disk_storage_account_type" {
  description = "The storage account type for the Managed Disk"
  value       = azurerm_managed_disk.standard_hdd_disk.storage_account_type
}
