variable "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  type = string
  #default = "networking-rg"
}

variable "location" {
  description = "Defines the Azure region where the resource group will be created"
  #efault = "uksouth"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)."
  type        = list(string)
  #default     = ["10.0.0.0/16"]
}