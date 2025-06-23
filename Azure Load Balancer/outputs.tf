output "load_balancer_public_ip" {
  value       = azurerm_public_ip.lb_public_ip.ip_address
  description = "Public IP address of the Standard Load Balancer"
}

output "load_balancer_id" {
  value       = azurerm_lb.standard_lb.id
  description = "ID of the Standard Load Balancer"
}
