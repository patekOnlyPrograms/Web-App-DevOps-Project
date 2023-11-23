variable "resource_group_name" {
  description = "This is the resource group where the application will be stored and used from"
  type = string
  default = "devops-resourcegroup"
}

variable "location" {
  description = "This is the location of the servers where the application will be run from"
  type = string
  default = "uksouth"
}

variable "vnet_address_space" {
  description = "This is the azure Azure virtual network where my services will use"
  type = list(string)
  default = ["10.0.0.0/16"]
}

