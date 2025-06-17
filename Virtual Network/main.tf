# main.tf
# Create the Resource Group (if not exists)
resource "azurerm_resource_group" "rg" {
  name     = "RG-prithivi-Terraform"  # The name of the Resource Group
  location = var.location             # Use the location variable

  tags = {
    environment = "Terraform"
    project     = "VNET-Project"
  }
}
# Create the Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = "RG-prithivi-Terraform"  # Resource group for the VNET
  address_space       = var.address_space

  tags = {
    environment = "Terraform"
    project     = "VNET-Project"
  }
}

# Create the first Subnet
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = "RG-prithivi-Terraform"  # Resource group for the subnet
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet1_address_prefix]  # Use address_prefixes as a list
}

# Create the second Subnet
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2_name
  resource_group_name  = "RG-prithivi-Terraform"  # Resource group for the subnet
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet2_address_prefix]  # Use address_prefixes as a list
}
