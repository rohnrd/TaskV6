# Create Az AD Group for AKS Admins
resource "azuread_group" "aks_administrators" {
  display_name = "${azurerm_resource_group.aks_rg.name}-cluster-administrators"
  security_enabled = true
  description = "Az AKS Kubernetes admin ${azurerm_resource_group.aks_rg.name}--${var.environment}-cluster."
}



