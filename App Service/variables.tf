variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
  default     = "RG-prithivi-Terraform"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "app_service_name" {
  description = "Globally unique App Service name"
  type        = string
  default     = "demo-web-app-unique123"
}

variable "service_plan_sku" {
  description = "App Service Plan SKU (F1, B1, B2, S1, P1v2, etc.)"
  type        = string
  default     = "B1"
  validation {
    condition     = contains(["F1", "B1", "B2", "S1", "S2", "P1v2", "P1v3"], var.service_plan_sku)
    error_message = "Allowed SKUs: F1, B1, B2, S1, S2, P1v2, P1v3"
  }
}

variable "runtime_stack" {
  description = "Runtime for the Linux Web App (e.g. NODE|18-lts, DOTNETCORE|6.0, PYTHON|3.10)"
  type        = string
  default     = "NODE|18-lts"
}
