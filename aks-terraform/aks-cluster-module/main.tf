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
  client_id       = var.service_principal_client_id
  client_secret   = var.service_principal_secret
  tenant_id       = "5eb1caa2-48eb-4186-8f02-36f64f1c6ce6"
}

resource "azurerm_resource_group" "resource-group" {
  location = var.cluster_location
  name     = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  dns_prefix          = var.dns_prefix
  kubernetes_version = var.kubernetes_version

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_secret
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

}