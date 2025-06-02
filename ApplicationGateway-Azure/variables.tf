variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to create or use"
  type        = string
  default     = "RG-prithivi-Terraform"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "backend_ip" {
  description = "Backend server IP address"
  type        = string
  default     = "10.0.2.4"
}
