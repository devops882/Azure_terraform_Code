variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "resource_group_name" {
  type    = string
  default = "RG-Prithivi-Terraform"
}
