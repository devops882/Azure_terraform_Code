# variables.tf

# Azure Region
variable "location" {
  description = "The Azure region to deploy the resources"
  type        = string
  default     = "East US"  # Change to your desired region
}

# Azure Subscription ID (define this in terraform.tfvars or as an environment variable)
variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

# Azure Tenant ID (define this in terraform.tfvars or as an environment variable)
variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
}

# Disk Name (Optional: Set the disk name you want)
variable "disk_name" {
  description = "The name of the Managed Disk"
  type        = string
  default     = "my-standard-hdd-disk"
}

# Disk Size in GiB
variable "disk_size_gb" {
  description = "The size of the Managed Disk (in GiB)"
  type        = number
  default     = 32  # 32 GiB for this disk
}
