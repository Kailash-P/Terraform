# Variable : Resource Group Name 
variable "app_gateway_resource_group_name" {
   type="string",
   description="Enter Resource Group name",
   default="RGKailash"
}

# Variable : Resource Group Location
variable "app_gateway_resource_group_location" {
   type="string",
   description="Enter Resource Group location",
   default="East US"
}

# Variable :  Virtual Network Name
variable "app_gateway_vnet_name" {
   type="string",
   description="Enter  Virtual Network name",
   default="my-vnet-12345"
}

# Variable :  Virtual Network Address Space
variable "app_gateway_vnet_address_space" {
   type="string",
   description="Enter  Address Space",
   default="10.254.0.0/16"
}

# Variable :  Subnet Name
variable "app_gateway_subnet_name" {
   type="string",
   description="Enter  Subnet name",
   default="my-subnet-1"
}

# Variable :  Subnet Address Prefix
variable "app_gateway_subnet_address_prefix" {
   type="string",
   description="Enter  Subnet Address Prefix",
   default="10.254.0.0/24"
}

# Variable :  Public IP Name
variable "app_gateway_public_ip_name" {
   type="string",
   description="Enter  Public IP Name",
   default="my-pip-12345"
}

# Variable :  Name
variable "app_gateway_name" {
   type="string",
   description="Enter Application Gateway  Name",
   default="my-application-gateway-12345"
}

# Variable :  Location
variable "app_gateway_location" {
   type="string",
   description="Enter Application Gateway Location",
   default="EAST US"
}

# Variable : Assignment of  Location

#app_gateway_location = ["East US", "South India"]

# Variable :  Sku Name
variable "app_gateway_sku_name" {
   type="string",
   description="Enter SKU Name",
   default="WAF_Medium"
}

# Variable : Assignment of  Sku Name

#app_gateway_sku_name = ["Standard_Small", "Standard_Medium", "Standard_Large", "Standard_v2", "WAF_Medium", "WAF_Large", "WAF_v2"]

# Variable :  Sku Tier
variable "app_gateway_sku_tier" {
   type="string",
   description="Enter  SKU Tier",
   default="WAF"
}

# Variable : Assignment of Sku Tier

#app_gateway_sku_tier=["Standard", "Standard_v2", "WAF", "WAF_v2"]

# Variable :  Sku Capacity
variable "app_gateway_sku_capacity" {
   type="string",
   description="Enter  SKU Capacity",
   default="2"
}

# Variable :  IP Config Name
variable "app_gateway_ip_config_name" {
   type="string",
   description="Enter Application Gateway  IP Config Name",
   default="my-gateway-ip-configuration"
}

# Variable :  Subnet Id
variable "app_gateway_ip_config_subnet_id" {
  type="string",
  description = "Enter Gateway IP Config  Subnet ID",
  default="my-gateway-ip-configuration"
}

variable "app_gateway_ip_config_subnet_name" {
  type="string",
  description = "Enter Gateway IP Config  Subnet ID",
  default="my-gateway-ip-configuration"
}
variable "app_gateway_ip_config_vnet_id" {
  type="string",
  description = "Enter Gateway IP Config  Subnet ID",
  default="my-gateway-ip-configuration"
}

# Variable :  Frontend Port

variable "app_gateway_frontend_port" {
   type="string",
   description="Enter Application Gateway Frontend Port",
   default="80"
}

# Variable :  Backend Http Settings Cookie Based Infinity

variable "app_gateway_backend_http_settings_cookie_based_infinity" {
   type="string",
   description="Enter  Backend Http Settings Cookie Based Infinity",
   default="Disabled"
}

#app_gateway_backend_http_settings_cookie_based_infinity = ["Enabled","Disabled"]

# Variable :  Backend Http Settings port

variable "app_gateway_backend_http_settings_port" {
   type="string",
   description="Enter  Backend Http Settings Port",
   default="80"
}

# Variable :  Backend Http Settings Protocol

variable "app_gateway_backend_http_settings_protocol" {
   type="string",
   description="Enter  Backend Http Settings Protocol",
   default="Http"
}

#app_gateway_backend_http_settings_protocol = ["Http","Https"]


# Variable : Backend Http Settings Request Timeout

variable "app_gateway_backend_http_settings_request_timeout" {
   type="string",
   description = "Enter  Backend Http Settings Request Timeout",
   default="1"
}

# Variable :  Http Listener Protocol

variable "app_gateway_http_listener_protocol" {
   type="string",
   description="Enter  Http Listener Protocol",
   default="Http"
}

#app_gateway_http_listener_protocol = ["Http", "Https"]

# Variable : WAF Firewall Mode

variable "app_gateway_waf_firewall_mode" {
    type="string",
    description="Enter Application Gateway WAF Firewall Mode",
    default="Prevention"
}

# Variable : WAF Rule Set Type

variable "app_gateway_waf_rule_set_type" {
    type="string",
    description="Enter Application WAF Rule Set Type",
    default="OWASP" 
}

# Variable : WAF Rule Set Verison

variable "app_gateway_waf_rule_set_version" {
    type="string",
    description="Enter Application Gateway WAF Rule Set Version",
    default="2.2.9"
}

# Variable : WAF Firewall Enabled

variable "app_gateway_waf_firewall_enabled" {
    type="string",
    description="Enter Application Gateway WAF Firewall Enabled",
    default="true"
}

# Variable : AKS Cluster Name

variable "app_gateway_aks_cluster_name" {
    type="string",
    description="Enter Application Gateway AKS Cluster Name"
}