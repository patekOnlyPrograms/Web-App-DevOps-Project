output "aks_cluster_name" {
  description = "Variable that will store the name of the provisioned cluster"
  value = azurerm_kubernetes_cluster.example.name
}

output "aks_cluster_id" {
  description = "Variable that will store the ID of the cluster"
  value = azurerm_kubernetes_cluster.example.id
}

output "aks_kubeconfig" {
  description = "Variable that will capture the Kubernetes configuration file of the cluster"
  value = azurerm_kubernetes_cluster.example.kube_config
}