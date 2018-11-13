output "login_server" {
  value = "${azurerm_container_registry.acr.login_server}"
}

output "admin_username" {
  value = "${azurerm_container_registry.acr.admin_username}"
}

output "admin_enabled" {
  value = "${azurerm_container_registry.acr.admin_enabled}"
}