output "vmss_name" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.name
}

output "ssh_command" {
  value = "ssh ${var.admin_username}@${azurerm_public_ip.lb_public_ip.ip_address} -p 50000"
}
