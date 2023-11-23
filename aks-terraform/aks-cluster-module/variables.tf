variable "aks_cluster_name" {
  description = "Variable that represents the name of the AKS cluster"
  type = string
  default = "aks-webDevops"
}

variable "cluster_location" {
  description = "Variable that specifies the Azure region"
  type = string
  default = "uk_south"
}

variable "dns_prefix" {
  description = "Variable that defines the DNS prefix of cluster"
  type = string
  default = "aks-cluster"
}

variable "kubernetes_version" {
  description = "Variable that specifies which Kubernetes version"
  type = string
  default = "1.28.3"
}


variable "resource_group_name" {
  description = "This is the resource group where the application will be stored and used from"
  type = string
}

variable "vnet_id" {
  description = "This is the id of the virtual network where the network will be situated"
  type = string
}

variable "control_plane_subnet_id" {
  description = "This is the id of the control plane subnet"
  type = string
}

variable "worker_node_subnet_id" {
  description = "This is the id of the worker node subnet"
  type = string
}
