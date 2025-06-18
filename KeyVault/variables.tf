variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "RG-prithivi-Terraform"
}

variable "key_vault_name" {
  description = "Base name for the Azure Key Vault"
  type        = string
  default     = "mykeyvault"
}

variable "secret_name" {
  description = "Secret name"
  type        = string
  default     = "mysecret"
}

variable "secret_value" {
  description = "Secret value"
  type        = string
  default     = "MySecretValue123!"
}
