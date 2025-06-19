variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "location" {
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  type        = string
  default     = "RG-Prithivi-Terraform"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
}
