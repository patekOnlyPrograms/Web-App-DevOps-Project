output "vnet_id" {
  description = "Store the ID of the previously created VNet"
  value = azurerm_virtual_network.vnet-example.id
}

output "control_plane_subnet_id" {
  description = "Variable that will hold the ID of the control plane subnet within the VNet"
  value =azurerm_subnet.control_plane.id
}

output "worker_node_subnet_id" {
  description = "Variable that will store the ID of the worker node subnet within the VNet."
  value = azurerm_subnet.worker_node.id
}

output "networking_resource_group_name" {
  description = "Variable that will provide the name of the Azure Resource Group where the networking resources were provisioned in"
  value = azurerm_resource_group.resource-group.id
}

output "aks_nsg_id" {
  description = "Variable that will store the ID of the Network Security Group (NSG)"
  value = azurerm_network_security_group.network_security_group.id
}