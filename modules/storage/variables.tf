# General
variable "resource_group_name" {
    description = "The name of the resource group"
    default = "tpo-dv-inf-rg"
}

variable "location" {    
    description = "The Azure region in which all resources should be created"
    default = "East US2"
}

# Storage account
variable "storage_name" {    
    description = "The name of the app service plan for the backend"
    default = "tpodvinfst"
}
variable "account_tier" {    
    description = "The name of the app service plan for the backend"
    default = "Standard"
}

variable "account_replication_type" {    
    description = "The name of the app service plan for the backend"
    default = "LRS"
}




