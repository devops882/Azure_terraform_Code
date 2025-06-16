resource "azurerm_resource_group" "rg" {
  name     = "RG-prithivi-Terraform"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vmss-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "vmss-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "vmss-lb-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb" {
  name                = "vmss-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "bepool" {
  name            = "vmss-bepool"
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_nat_pool" "ssh_nat_pool" {
  name                           = "SSHInboundNAT"
  resource_group_name            = azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.lb.id
  frontend_ip_configuration_name = "PublicIPAddress"
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50099
  backend_port                   = 22
}

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                             = "vmss-b2s"
  location                         = var.location
  resource_group_name              = azurerm_resource_group.rg.name
  sku                              = "Standard_B2s"
  instances                        = 1
  admin_username                   = var.admin_username
  admin_password                   = var.admin_password
  disable_password_authentication = false
  upgrade_mode                     = "Manual"

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name                                   = "internal"
      subnet_id                              = azurerm_subnet.subnet.id
      primary                                = true
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bepool.id]
      load_balancer_inbound_nat_rules_ids    = [azurerm_lb_nat_pool.ssh_nat_pool.id]
    }
  }
}
