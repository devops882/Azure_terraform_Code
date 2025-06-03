variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  default     = "RG-prithivi-Terraform"
  description = "Name of the Resource Group"
}

variable "location" {
  default     = "East US"
  description = "Azure region"
}

variable "vm_name" {
  default = "ubuntu24-vm"
}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  default = "azureuser@12345"
}
