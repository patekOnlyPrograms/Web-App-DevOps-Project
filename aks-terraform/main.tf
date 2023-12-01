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
  client_id       = "0f9a87db-9c63-4d0c-9ce6-89e243da1d2d"
  client_secret   = "Yje8Q~YOxS1nu3Cl6lino7cpYZCOOfBxGhoGFdpt"
  subscription_id = "60772c8b-e7d2-476a-8623-9ed386b51689"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
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
  service_principal_client_id     = "0f9a87db-9c63-4d0c-9ce6-89e243da1d2d"
  service_principal_client_secret = "Yje8Q~YOxS1nu3Cl6lino7cpYZCOOfBxGhoGFdpt"


  #Input variables referencing output from networking module
  resource_group_name             = module.networking.resource_group_name
  vnet_id                         = module.networking.vnet_id
  control_plane_subnet_id         = module.networking.control_plane_subnet_id
  worker_node_subnet_id           = module.networking.worker_node_subnet_id
  aks_nsg_id                      = module.networking.aks_nsg_id
}