resource "azurerm_key_vault" "tempo" {
  name                        = var.key_vault_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  enabled_for_disk_encryption = var.disk_encryption
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection
  sku_name                    = var.sku_tier  
  tenant_id                   = var.tenant_id
}