variable "vnet_name" {
  description = "Name of the vnet to create" 
  default     = "vnetsamname" 
}

variable "resource_group_name" {
  description = "Default resource group name that the network will be created in." 
  default     = "M1047730RG"  
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "EastUS" 
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "subnet_prefixes" {
  type        = "list"
  description = "The address prefix to use for the subnet." 
    default     = ["10.0.1.0/24","10.0.120.0/24"]
}

variable "subnet_names" {
  type        = "list"
  description = "A list of public subnets inside the vNet." 
  default     = ["subnet1","subnet2"]

}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = "map"

  default = {
    tag1 = ""
    tag2 = ""
  }
}

variable "subnets_list" {
  type    = "list"
  default = [
      {
        name                   = "subnet1"        
        subnet_prefixes  = "10.0.3.0/24"
        type="private"
      },
      {
        name                   = "subnet2"        
        subnet_prefixes  = "10.0.1.0/24"
        type="public"
      }
    ]
}

# variables for network security rules

variable "nsg_predefined_rules" {
  type    = "list"
  default =  [
      
    ]
}

# Custom security rules
# [priority, direction, access, protocol, source_port_range, destination_port_range, description]"
# All the fields are required.
variable "nsg_custom_rules" {
  description = "Security rules for the network security group using this format name = [priority, direction, access, protocol, source_port_range, destination_port_range, source_address_prefix, destination_address_prefix, description]"
  type        = "list"
  default     = [
     
    ]
}
