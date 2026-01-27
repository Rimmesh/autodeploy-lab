output "app_name" {
  description = "Name of the Azure App Service"
  value       = azurerm_linux_web_app.app.name
}

output "app_url" {
  description = "Public URL of the deployed API"
  value       = "https://${azurerm_linux_web_app.app.default_hostname}"
}