# main.tf

# Create the Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "RG-prithivi-Terraform"
  location = var.location

  tags = {
    environment = "Terraform"
    project     = "Disk-Project"
  }
}

# Create the Standard HDD Managed Disk (32 GiB, LRS)
resource "azurerm_managed_disk" "standard_hdd_disk" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"   # Standard HDD with LRS
  disk_size_gb         = var.disk_size_gb  # Size of the disk in GiB
  create_option        = "Empty"            # Create an empty disk

  tags = {
    environment = "Terraform"
    project     = "Disk-Project"
  }
}
