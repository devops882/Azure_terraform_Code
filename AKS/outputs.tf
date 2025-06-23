output "aks_resource_group" {
  description = "The name of the AKS resource group"
  value       = azurerm_resource_group.aks_rg.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_kube_config" {
  description = "Kubeconfig for accessing the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
