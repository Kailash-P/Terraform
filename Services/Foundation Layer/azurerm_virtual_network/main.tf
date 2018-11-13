resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${var.resource_group_name}"
  dns_servers         = "${var.dns_servers}"
  tags                = "${var.tags}"
}

# resource "azurerm_subnet" "subnet" {
#   name                 = "${var.subnet_names[count.index]}"
#   virtual_network_name = "${azurerm_virtual_network.vnet.name}"
#   resource_group_name  = "${var.resource_group_name}"
#   address_prefix       = "${var.subnet_prefixes[count.index]}"
#   network_security_group_id=  "${module.network-security-group.network_security_group_id}" 
#   count                = "${length(var.subnet_names)}"
# }

resource "azurerm_subnet" "subnet" {
  count                       = "${length(var.subnets_list)}"
  name                        = "${lookup(var.subnets_list[count.index], "name")}" 
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${var.resource_group_name}"
  address_prefix       = "${lookup(var.subnets_list[count.index], "subnet_prefixes")}" 
  network_security_group_id= "${lookup(var.subnets_list[count.index], "type") == "private" ? "${module.Pnetwork-security-group.network_security_group_id}" : "${module.network-security-group.network_security_group_id}"}"
  count                = "${length(var.subnet_names)}"
}

module "network-security-group" {
   
    source="../azurerm_network_security_group" 
    security_group_name="pravitensg0"    
    predefined_rules           ="${var.nsg_predefined_rules}"
    custom_rules               = "${var.nsg_custom_rules}"
    resource_group_name = "${var.resource_group_name}"
    
}

module "Pnetwork-security-group" {
   
     source="../azurerm_network_security_group"  
    security_group_name="pravitensg1"  
    resource_group_name = "${var.resource_group_name}" 
    predefined_rules           = [
      
    ]
    custom_rules               = [
      {
       name                   = "myhttp"
        priority               = "100"
        direction              = "Outbound"        
        access                 = "Deny"
        protocol               = "*"
        destination_port_range = "8080"        
        description            = "description-myhttp"
        destination_address_prefix="Internet"
      }
    ]
    
}
