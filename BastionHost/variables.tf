variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group"
  type        = string
  default     = "RG-prithivi-Terraform"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "bastion_sku" {
  description = "Bastion Host SKU (Basic or Standard)"
  type        = string
  validation {
    condition     = contains(["Basic", "Standard"], var.bastion_sku)
    error_message = "Allowed values for bastion_sku are Basic or Standard."
  }
}
