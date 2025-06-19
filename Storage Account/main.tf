resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "azurerm_storage_account" "storage" {
  name                     = "storage${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type



  tags = {
    environment = "Terraform"
  }
}
