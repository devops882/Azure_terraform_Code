output "key_vault_name_generated" {
  description = "The generated Key Vault name with random suffix"
  value       = azurerm_key_vault.kv.name
}

output "key_vault_id" {
  description = "Key Vault resource ID"
  value       = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.kv.vault_uri
}

output "secret_id" {
  description = "Stored secret ID"
  value       = azurerm_key_vault_secret.secret.id
}

output "secret_value" {
  description = "Stored secret value (sensitive)"
  value       = azurerm_key_vault_secret.secret.value
  sensitive   = true
}
