# General
variable "resource_group_name" {
    description = "The name of the resource group"
    default = "tpo-dv-inf-rg"
}

variable "location" {    
    description = "The Azure region in which all resources should be created"
    default = "East US2"
}

# App Service
variable "application_insights_name" {    
    description = "The name of the application insights for the tempo"
    default = "tpo-dv-inf-appi"
}
variable "application_type" {    
    description = "The name of the application insights for the tempo"
    default = "web"
}









