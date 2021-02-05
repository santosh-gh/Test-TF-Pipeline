# Deployment Environment
variable "environment" {
    description = "The name of the environment"
    default = "dev"
}

# Environment Alies
variable "env-alias" {
    description = "The alias of the deployment environment"
    type = map
    default = {
      dev  = "dv"
      qa   = "qa"
      stg  = "sg"
      prd  = "pd"
    }
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

# App Service Plan
variable "app_service_plan_name" {    
    description = "The name of the app service plan"
    default = "tpo-dv-plan-tpoplan"
}

#PremiumV2 Tier → P1v2, P2v2, P3v2 (Small, Medium, Large)
#PremiumV3 Tier → P1v3, P2v3, P3v3 (Small, Medium, Large)

variable "app_service_plan_tier" {
    description = "sku tier"
    type = map
    default = {
      dev  = "PremiumV2"
      qa   = "PremiumV2"
      stg  = "PremiumV2"
      prd  = "PremiumV3"
    }
}

variable "app_service_plan_size" {
    description = "sku size"
    type = map
    default = {
      dev  = "P3v2"
      qa   = "P3v2"
      stg  = "P3v2"
      prd  = "P3v3"
    }
}

variable "app_service_name" {    
    description = "The name of the app service for the backend"
    default = "tpo-dv-web-tpoweb"
}

# Application Insights
variable "application_insights_name" {    
    description = "The name of the application insights resource"
    default = "tpo-dv-inf-appi"
}

variable "kind" {    
    description = "The App Service Plan OS"
    default = "Windows"
}

# Storage Paramaters
variable "storage_name" {
  default = "tempostoragetest"
}

variable "account_tier" {    
    description = "The storage account tier"
    default = "Standard"
}

# Environment Alies
variable "account_replication_type" {
    description = "The alias of the deployment environment"
    type = map
    default = {
      dev  = "LRS"
      qa   = "LRS"
      stg  = "LRS"
      prd  = "GRS"
    }
}


variable "application_type" {    
    description = "The name of the application insights for the tempo"
    default = "web"
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

variable "sku_tier" {
  type = string
  default = "Standard"
}

variable "sku_size" {
  type = string
  default = "S1"
}

# Key Vault

variable "key_vault_name" {    
    description = "The name of the app service plan for the backend"
    default = "tpo-dv-tpokeyvault"
}

variable "keyvault_sku_tier" {
  type = string
  default = "standard"
  
}

variable "disk_encryption" {
  type = bool
  default = false
}

variable "purge_protection" {
  type = bool
  default = false
}

variable "soft_delete_retention_days" {
  type = number
  default = 7
}

variable "tenant_id" {    
    description = "The name of the tenant_id"
    default = "59caabf4-4671-41a4-a9f3-c0f9adeb1fc1"
}