terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = ""
  client_secret   = ""
  subscription_id = ""
  tenant_id       = ""
}

module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  resource_group_name = "networking-rg"
  location           = "UK South"
  vnet_address_space = ["10.0.0.0/16"]

}


module "aks-cluster" {
  source = "./aks-cluster-module"


  #input variables for the AKS cluster node
  aks_cluster_name                = "terraform-aks-cluster"
  cluster_location                = "UK South"
  dns_prefix                      = "aks-practice"
  kubernetes_version              = "1.28.3"
  service_principal_client_id     = "c05936a9-f015-4ad8-b623-a3197ee6d6d4"
  service_principal_client_secret = "QmF8Q~NnytC.nMvaYIbmjbJo.WNgQP2EPSxEqbOg"


  #Input variables referencing output from networking module
  resource_group_name             = module.networking.resource_group_name
  vnet_id                         = module.networking.vnet_id
  control_plane_subnet_id         = module.networking.control_plane_subnet_id
  worker_node_subnet_id           = module.networking.worker_node_subnet_id
  aks_nsg_id                      = module.networking.aks_nsg_id
}