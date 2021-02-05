# General
variable "resource_group_name" {
    description = "The name of the resource group"
    default = "tpo-dv-inf-rg"
}

variable "location" {    
    description = "The Azure region in which all resources should be created"
    default = "East US2"
}

variable "key_vault_name" {    
    description = "The name of the key vault"
    default = "tpo-dv-tpokeyvault"
}

variable "tenant_id" {    
    description = "The name of the tenant_id"
    default = "tpo-dv-tpokeyvault"
}

variable "sku_tier" {
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


 











