variable "resource_group_name" {
  description = "This is the resource group where the application will be stored and used from"
  type = string
  default = "Application Resource Group"
}

variable "location" {
  description = "This is the location of the servers where the application will be run from"
  type = string
  default = "uk_south"
}

variable "vnet_address_space" {
  description = "This is the azure Azure virtual network where my services will use"
  type = list(string)
  default = ["10.0.0.0/16"]
}

