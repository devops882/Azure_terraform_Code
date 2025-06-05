resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "plan" {
  name                = "${var.resource_group_name}-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = var.service_plan_sku
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      dotnet_version = startswith(var.runtime_stack, "DOTNETCORE") ? split("|", var.runtime_stack)[1] : null
      node_version   = startswith(var.runtime_stack, "NODE")       ? split("|", var.runtime_stack)[1] : null
      python_version = startswith(var.runtime_stack, "PYTHON")     ? split("|", var.runtime_stack)[1] : null
    }
  }

  https_only = true
}
