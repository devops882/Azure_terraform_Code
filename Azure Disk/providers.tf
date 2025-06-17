# provider.tf

provider "azurerm" {
  features {}

  # Optionally specify the subscription and tenant ID
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
