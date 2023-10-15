

#  Settings Block
terraform {
  #  Version Terraform
  required_version = ">= 0.13"
  # Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

# Terraform State Storage
  backend "azurerm" {
   /*
    resource_group_name   = "terraformstateronrg045"
    storage_account_name  = "terraformstoragerg045"
    container_name        = "tfstatefiles-v45"
    key                   = "dev.terraform.tfstate"
  */
  }  
}


#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
# Provider Block for AzureRM
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Random Pet Resource
resource "random_pet" "aksrandom" {

}

/*
command
# List Node Pools
az aks nodepool list --resource-group terraform-aks-dev --cluster-name  terraform-aks-dev-cluster --output table

# List Nodes using Labels
kubectl get nodes -o wide
kubectl get nodes -o wide -l nodepoolos=linux
kubectl get nodes -o wide -l nodepoolos=windows
kubectl get nodes -o wide -l environment=dev
```
# Create Folder
mkdir $HOME/.ssh/aks-prod-sshkeys-terraform
mkdir A:/.ssh/aks-prod-sshkeys-terraform
# Create SSH Key
ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f A:/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey -N mypassphrase

# Azure AKS Get Credentials with --admin
az aks get-credentials --resource-group terraform-aks-dev --name terraform-aks-dev-cluster --admin

# Get Full Cluster Information
az aks show --resource-group terraform-aks-dev --name terraform-aks-dev-cluster
az aks show --resource-group terraform-aks-dev --name terraform-aks-dev-cluster -o table
*/