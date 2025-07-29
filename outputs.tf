output "web_app_url" {
  description = "The default URL of the deployed Azure Web App"
  value       = azurerm_windows_web_app.example.default_hostname
}
 