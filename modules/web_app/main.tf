provider "azurerm" {
  features {}
}

# App Service
resource "azurerm_app_service" "tempo" {  
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_planid
  
  site_config {
    websockets_enabled = true
  }

  tags = {
    environment = var.environment
  } 

  app_settings = {
  #"APPINSIGHTS_INSTRUMENTATIONKEY"      = "${azurerm_application_insights.this.instrumentation_key}"
    "APPINSIGHTS_PORTALINFO"            = var.APPINSIGHTS_PORTALINFO
    "APPINSIGHTS_PROFILERFEATURE_VERSION" = var.APPINSIGHTS_PROFILERFEATURE
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"  = var.WEBSITE_HTTPLOGGING_RETENTION
  }
}


