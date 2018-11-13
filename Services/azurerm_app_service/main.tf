resource "azurerm_app_service_plan" "default" {
  name                = "${var.application_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  sku {
    tier = "${var.app_service_plan_sku_tier}"
    size = "${var.app_service_plan_sku_size}"
  }
}

resource "azurerm_app_service" "default" {
  name                = "${var.application_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_app_service_plan.default.resource_group_name}"
  app_service_plan_id = "${azurerm_app_service_plan.default.id}"
  
app_settings {
"APPINSIGHTS_INSTRUMENTATIONKEY" = "${var.appinsights_instrumentationkey}"
}


}


