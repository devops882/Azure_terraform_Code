# outputs.tf

output "vnet_id" {
  description = "The ID of the created Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet1_id" {
  description = "The ID of the first Subnet"
  value       = azurerm_subnet.subnet1.id
}

output "subnet2_id" {
  description = "The ID of the second Subnet"
  value       = azurerm_subnet.subnet2.id
}

output "subnet1_address_prefix" {
  description = "The address prefix for the first Subnet"
  value       = azurerm_subnet.subnet1.address_prefixes
}

output "subnet2_address_prefix" {
  description = "The address prefix for the second Subnet"
  value       = azurerm_subnet.subnet2.address_prefixes
}
