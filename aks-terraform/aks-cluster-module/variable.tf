variable "aks_cluster_name" {
  description = "Variable specifies the name of the AKS cluster that will be created"
  type = string

}

variable "cluster_location" {
  description = "Defines the Azure region where the AKS cluster will be created"
  type = string
}

variable "dns_prefix" {
  description = "Sets the DNS prefix for the AKS cluster, which is used to create a unique DNS name for the cluster"
  type = string

}

variable "kubernetes_version" {
  description = "Specifies the version of Kubernetes to be used for the AKS cluster"
  type = string

}

variable "service_principal_client_id" {
  description = "Is the Client ID of the service principal used for authenticating and managing the AKS cluster"
  type = string
}

variable "service_principal_client_secret" {
  description = "Specifies the Client Secret associated with the service principal used for AKS cluster"
  type = string
}



# Input variables from the networking module

variable "vnet_id" {
  description = "ID of the Virtual Network (VNet)."
  type = string
  #value       = azurerm_virtual_network.aks_vnet.id
}


variable "control_plane_subnet_id" {
  description = "ID of the control plane subnet."
  type = string
  #value       = azurerm_subnet.control_plane_subnet.id
}

variable "worker_node_subnet_id" {
  description = "ID of the worker node subnet."
  type = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  type = string
  #value       = azurerm_resource_group.networking.name
}

# Define more output variables as needed...
variable "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  type = string
  #value       = azurerm_network_security_group.aks_nsg.id
}

