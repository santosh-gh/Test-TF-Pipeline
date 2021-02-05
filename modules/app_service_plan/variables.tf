# General
variable "environment" {    
    description = "Deployment Environment"
    default = "Dev"
}

variable "resource_group_name" {
    description = "The name of the resource group"
    default = "tpo-dv-inf-rg"
}

variable "location" {    
    description = "The Azure region in which all resources should be created"
    default = "East US2"
}

# App Service
variable "app_service_plan_name" {    
    description = "The name of the app service plan for the backend"
    default = "tpo-dv-plan-tpoplan"
}

variable "kind" {    
    description = "The kind for the app service plan"
    default = "Windows"
}

variable "sku_tier" {
  type = string
  default = "Standard"
  
}

variable "sku_size" {
  type = string
  default = "S1"
}










