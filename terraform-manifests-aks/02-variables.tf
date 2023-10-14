# Az Location
variable "location" {
  type = string
  description = "Loacation for Azure resources"
  default = "East US"
}

# Az Resource Group 
variable "resource_group_name" {
  type = string
  description = "Resource Group"
  default = "terraform-aks"
}

# Az AKS Environment 
variable "environment" {
  type = string  
  description = "Environment"  
  #default = "dev"
}


# SSH Public Key for Linux 
variable "ssh_public_key" {
  #default = "A:/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "SSH Public Key for Linux"  
}

# Win Admin Username 
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "Defines the username"  
}

# Win Admin Password 
variable "windows_admin_password" {
  type = string
  default = "Testyour@blity2023"
  description = "Defines the password"  
}

