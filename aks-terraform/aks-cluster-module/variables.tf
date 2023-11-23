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
  type = number
  default = 1.6.3
}

variable "service_principal_client_id" {
  description = "Variable that provides the Client ID"
  type = string
  default = "5eb1caa2-48eb-4186-8f02-36f64f1c6ce6"
}

variable "service_principal_secret" {
  description = "Variable that supplies the Client Secret for the service principal"
  type = string
  default = "OO88Q~vURcyciXgyT4RmdFgtIkDYaSsYwk1tca1B"
}

