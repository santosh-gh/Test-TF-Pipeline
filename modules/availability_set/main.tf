resource "azurerm_availability_set" "availability" {
  name                = var.availability_set_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = {
    environment = var.environment
  }
}