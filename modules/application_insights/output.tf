output "application_insights_id" {
  description = "Id of the created App Service Plan"
  value       = azurerm_application_insights.tempo.id
}