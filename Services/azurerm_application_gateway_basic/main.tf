resource "azurerm_public_ip" "pip" {
  name                         = "${var.app_gateway_public_ip_name}"
  location                     = "${var.app_gateway_location}"
  resource_group_name          = "${var.app_gateway_resource_group_name}"
  public_ip_address_allocation = "dynamic"
}

# Create an application gateway
resource "azurerm_application_gateway" "network" {
  name                = "${var.app_gateway_name}"
  resource_group_name = "${var.app_gateway_resource_group_name}"
  location            = "${var.app_gateway_location}"

  sku {
    name           = "${var.app_gateway_sku_name}"
    tier           = "${var.app_gateway_sku_tier}"
    capacity       = "${var.app_gateway_sku_capacity}"
  }

  gateway_ip_configuration {
    name         = "${var.app_gateway_ip_config_name}"
    subnet_id    = "${var.app_gateway_ip_config_vnet_id}/subnets/${var.app_gateway_ip_config_subnet_name}"
  }

  frontend_port {
    name         = "${var.app_gateway_vnet_name}-feport"
    port         = "${var.app_gateway_frontend_port}"
  }

  frontend_ip_configuration {
    name         = "${var.app_gateway_vnet_name}-feip"
    public_ip_address_id = "${azurerm_public_ip.pip.id}"
  }

  backend_address_pool {
    name = "${var.app_gateway_vnet_name}-beap"
  }

  backend_http_settings {
    name                  = "${var.app_gateway_vnet_name}-be-htst"
    cookie_based_affinity = "${var.app_gateway_backend_http_settings_cookie_based_infinity}"
    port                  = "${var.app_gateway_backend_http_settings_port}"
    protocol              = "${var.app_gateway_backend_http_settings_protocol}"
    request_timeout       = "${var.app_gateway_backend_http_settings_request_timeout}"
  }

  http_listener {
    name                            = "${var.app_gateway_vnet_name}-httplstn"
    frontend_ip_configuration_name  = "${var.app_gateway_vnet_name}-feip"
    frontend_port_name              = "${var.app_gateway_vnet_name}-feport"
    protocol                        = "${var.app_gateway_http_listener_protocol}"
  }

  request_routing_rule {
    name                       = "${var.app_gateway_vnet_name}-rqrt"
    rule_type                  = "Basic"
    http_listener_name         = "${var.app_gateway_vnet_name}-httplstn"
    backend_address_pool_name  = "${var.app_gateway_vnet_name}-beap"
    backend_http_settings_name = "${var.app_gateway_vnet_name}-be-htst"
  }
  
  waf_configuration {
      firewall_mode="${var.app_gateway_waf_firewall_mode}"
      rule_set_type ="${var.app_gateway_waf_rule_set_type}"
      rule_set_version ="${var.app_gateway_waf_rule_set_version}"
      enabled = "${var.app_gateway_waf_firewall_enabled}"
  }
}