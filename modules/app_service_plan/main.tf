provider "azurerm" {
  features {}
}

# App Service Plan
resource "azurerm_app_service_plan" "tempo" {
  name                = var.app_service_plan_name  
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = var.kind
  sku {
    tier = var.sku_tier
    size = var.sku_size
  }

  tags = {
    environment = var.environment
  }  
}

