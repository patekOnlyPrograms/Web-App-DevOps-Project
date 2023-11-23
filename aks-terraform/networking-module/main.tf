terraform {
  required_providers {
    azurerm= {
      source = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "37a9fc7f-c9d6-4a9b-a69d-ab2d121cfbc7"
  client_id       = "c05936a9-f015-4ad8-b623-a3197ee6d6d4"
  client_secret   = "Aga8Q~1cfAlKfEIyPfw49E.t2Na3xiFaBaeHxcjQ"
  tenant_id       = "5eb1caa2-48eb-4186-8f02-36f64f1c6ce6"
}

data "http" "myip"{
  url = "http://ipv4.icanhazip.com"
}

resource "azurerm_resource_group" "resource-group" {
  location = var.location
  name     = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet-example" {
  address_space       = var.vnet_address_space
  location            = var.location
  name                = "azurerm-virtual-network-resource"
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "control_plane" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = "control-plane-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-example.name
}

resource "azurerm_subnet" "worker_node" {
  address_prefixes     = ["10.0.2.0/24"]
  name                 = "worker-node-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-example.name
}



resource "azurerm_network_security_group" "network_security_group" {
  location            = var.location
  name                = "NetworkSecurityGroupRules"
  resource_group_name = var.resource_group_name

  security_rule {
    name = "kube-apiserver-rule"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${chomp(data.http.myip.body)}/32"
    destination_address_prefix = "*"
  }

  security_rule {
    name = "ssh-rule"
    priority = 101
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${chomp(data.http.myip.body)}/32"
    destination_address_prefix = "*"
  }
}