variable "environment" {    
    description = "Deployment Environment"
    default = "Dev"
}

# General
variable "resource_group_name" {
    description = "The name of the resource group"
    default = "tpo-dv-inf-rg"
}

variable "location" {    
    description = "The Azure region in which all resources should be created"
    default = "East US2"
}

variable "app_service_name" {    
    description = "The name of the app service for the backend"
    default = "tpo-dv-app-ediapp"
}

variable "app_service_planid" {    
    description = "The name of the app service for the backend"
}

variable "APPINSIGHTS_PORTALINFO" {    
    description = "The name of the APPINSIGHTS_PORTALINFO" 
    default = "ASP.NET"
    
}

variable "APPINSIGHTS_PROFILERFEATURE" {    
    description = "The version of the APPINSIGHTS_PROFILERFEATURE" 
    default = "1.0.0"
    
}

variable "WEBSITE_HTTPLOGGING_RETENTION" {    
    description = "The retention days of the WEBSITE_HTTPLOGGING" 
    default = "35"
}







