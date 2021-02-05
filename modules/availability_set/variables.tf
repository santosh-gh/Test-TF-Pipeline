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

# App Configuration
variable "availability_set_name" {    
    description = "The name of the app configuration"
    default = "tpo-dv-availability_set"
}
