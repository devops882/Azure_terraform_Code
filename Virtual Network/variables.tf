# variables.tf

# Location of the resources (default to "East US")
variable "location" {
  description = "The Azure region to deploy the resources"
  type        = string
  default     = "East US"  # Default to East US
}

# Name of the Virtual Network
variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "my-vnet"
}

# Address space for the Virtual Network
variable "address_space" {
  description = "The address space for the VNET"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Name of the first subnet
variable "subnet1_name" {
  description = "The name of the first Subnet"
  type        = string
  default     = "subnet1"
}

# Address prefix for the first subnet
variable "subnet1_address_prefix" {
  description = "The address prefix for the first Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Name of the second subnet
variable "subnet2_name" {
  description = "The name of the second Subnet"
  type        = string
  default     = "subnet2"
}

# Address prefix for the second subnet
variable "subnet2_address_prefix" {
  description = "The address prefix for the second Subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Subscription ID for Azure
variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

# Tenant ID for Azure
variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
}
