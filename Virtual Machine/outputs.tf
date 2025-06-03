output "public_ip" {
  value       = azurerm_public_ip.public_ip.ip_address
  description = "The public IP address of the virtual machine."
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}
