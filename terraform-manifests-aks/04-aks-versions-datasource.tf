# Ref: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_service_versions
# Datasource to get Latest Azure AKS Version
data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.aks_rg.location
  include_preview = false
}
# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "insights" {
  name                = "${var.environment}-logs-${random_pet.aksrandom.id}"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  retention_in_days   = 30
}
# Create Az AD Group for AKS Admins
resource "azuread_group" "aks_administrators" {
  display_name = "${azurerm_resource_group.aks_rg.name}-cluster-administrators"
  security_enabled = true
  description = "Az AKS Kubernetes admin ${azurerm_resource_group.aks_rg.name}--${var.environment}-cluster."
}

