output "app_service_plan_id" {
  description = "Id of the created App Service Plan"
  value       = azurerm_app_service_plan.tempo.id
}