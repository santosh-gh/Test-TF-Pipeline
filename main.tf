# Configure the Azure Provider
provider "azurerm" {
  features {}
}

resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}

output "random_string_output" {
  value = random_string.random.result
}

locals {
  # resource group
    resource_group_name       = "tpo-${var.env-alias[var.environment]}-inf-rg"

  # App Service Plan
    app_service_plan          = "tpo-${var.env-alias[var.environment]}-plan-tempo" //tpo-dv-plan-tempo
    sku_tier                  = "${var.app_service_plan_tier[var.environment]}"    //PremiumV2, PremiumV3
    sku_size                  = "${var.app_service_plan_size[var.environment]}"    //P2v2, P3v2, P3v2,P3v3

  # Web Apps
    web_app_site              = "tpo-${var.env-alias[var.environment]}-app-web"   //tpo-dv-app-web
    web_app_edi               = "tpo-${var.env-alias[var.environment]}-app-edi"   //tpo-dv-app-edi
    web_app_wcf               = "tpo-${var.env-alias[var.environment]}-app-wcf"   //tpo-dv-app-wcf
    web_app_api               = "tpo-${var.env-alias[var.environment]}-app-api"   //tpo-dv-app-api
    web_app_core              = "tpo-${var.env-alias[var.environment]}-app-core"  //tpo-dv-app-core

  # Application Insights
    application_insights      = "tpo-${var.env-alias[var.environment]}-appi-tpoapp" //tpo-dv-appi-tpoapp

  # Storage 
    storage_name              = "tpo${var.env-alias[var.environment]}sttpoapp${lower(random_string.random.result)}" //tpodvsttpoappxxxxx
    replication_type          = "${var.account_replication_type[var.environment]}" //LRS,ZRS,GRS

  # Key Vault
    key_vault_name            = "tpo-${var.env-alias[var.environment]}-kv-tpoapp" //tpo-dv-kv-tpoapp

    # App Configuration
    app_configuration_name    = "tpo-${var.env-alias[var.environment]}-app-confg" //tpo-dv-app-confg

    #availability_zones = ["${var.region}a", "${var.region}b"]
}

# Create a resource group
resource "azurerm_resource_group" "tempo" {
    name     = local.resource_group_name
    location = var.location
}

module "app_service_plan"{
    source    =  "./modules/app_service_plan"
    app_service_plan_name = local.app_service_plan
    resource_group_name   = azurerm_resource_group.tempo.name
    location              = azurerm_resource_group.tempo.location
    kind                  = var.kind
    sku_tier              = local.sku_tier
    sku_size              = local.sku_size   
    environment           = var.environment
}

module "app_service_webapp_site"{
    source                      =  "./modules/web_app"
    app_service_name            = local.web_app_site     
    resource_group_name         = azurerm_resource_group.tempo.name
    location                    = azurerm_resource_group.tempo.location   
    app_service_planid          = module.app_service_plan.app_service_plan_id   
    environment                 = var.environment  
}


module "app_service_webapp_edi"{
    source                    =  "./modules/web_app"
    app_service_name          = local.web_app_edi
    resource_group_name       = azurerm_resource_group.tempo.name
    location                  = azurerm_resource_group.tempo.location   
    app_service_planid        = module.app_service_plan.app_service_plan_id     
    environment               = var.environment
}  
  
module "application_insights"  {
    source                    = "./modules/application_insights"
    application_insights_name = local.application_insights
    resource_group_name       = azurerm_resource_group.tempo.name
    location                  = azurerm_resource_group.tempo.location
    application_type          = var.application_type   
}

module "storage_account" {
    source                    = "./modules/storage"
    storage_name              = local.storage_name
    account_tier              = var.account_tier
    account_replication_type  = local.replication_type
    resource_group_name       = azurerm_resource_group.tempo.name
    location                  = azurerm_resource_group.tempo.location  
}

module "key_vault" {
    source                     = "./modules/key_vault"
    key_vault_name             = azurerm_resource_group.tempo.name
    location                   = azurerm_resource_group.tempo.location  
    disk_encryption            = var.disk_encryption
    soft_delete_retention_days = var.soft_delete_retention_days
    purge_protection           = var.purge_protection
    sku_tier                   = var.keyvault_sku_tier
    tenant_id                  = var.tenant_id
}

module "app_configuration" {
    source                    = "./modules/app_configuration"
    app_configuration_name    = local.app_configuration_name
    resource_group_name       = azurerm_resource_group.tempo.name
    location                  = azurerm_resource_group.tempo.location  
}
