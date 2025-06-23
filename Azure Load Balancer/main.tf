resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "standard_lb" {
  name                = "standard-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicFrontend"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "BackendPool"
  loadbalancer_id     = azurerm_lb.standard_lb.id
}

resource "azurerm_lb_probe" "http_probe" {
  name                = "httpProbe"
  loadbalancer_id     = azurerm_lb.standard_lb.id
  protocol            = "Http"
  port                = 80
  request_path        = "/healthcheck"
  interval_in_seconds = 5
  number_of_probes    = 2
}
