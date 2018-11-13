resource "azurerm_application_insights" "appinsights" {
  name                = "${var.Appication_insights_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  application_type    = "Web"
}