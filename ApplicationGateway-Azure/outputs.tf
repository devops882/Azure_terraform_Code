output "application_gateway_public_ip" {
  description = "Public IP address of the Application Gateway"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "application_gateway_name" {
  description = "Application Gateway name"
  value       = azurerm_application_gateway.appgw.name
}

output "resource_group_name" {
  description = "Resource Group Name used"
  value       = azurerm_resource_group.rg.name
}
