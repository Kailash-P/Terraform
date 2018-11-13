variable "subscription_id" {
    description = "Azure Cloud subscription id"
    # default = "2a037a4a-5098-4d7b-989d-a0d8991dd035"
}
variable "tenant_id" {
    description = "Azure Cloud tenant id"
    # default = "de9fbf7e-8628-41a3-9da7-c13f73c55652"
}
variable "client_id" {
    description = "Service principal client id"
    # default = "297b9274-5c60-45a0-b6b6-dc11a23e63b9"
}
variable "client_secret" {
    description = "Service principal client secret"
    # default = "PnRtlDisFNaZzA1u9aSfpgqFTY1+72TI7XuRUTuOTEI="
}
variable "resource_group_name" {
  description = "Default resource group name that the network will be created in." 
  default     = "M1047730RG"  
}

variable "vnet_name" {
  description = "Name of the vnet to create" 
  # default     = "parentvnetname" 
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "EastUS" 
}

variable "subnets_list" {
  type    = "list"
  default = [
      {
        name                   = "privatesubnet1"        
        subnet_prefixes  = "10.1.0.0/24"
        type="private"
      },
      {
        name                   = "publicsubnet2"        
        subnet_prefixes  = "10.1.3.0/24"
        type="public"
      }
    ]
}

variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.1.0.0/16"
}

variable "postgresql_server_name" {
description="Enter the PostgreSQL Server name"
# default="m1047730server"  
}

variable "db_names" {
  description = "The list of names of the PostgreSQL Database, which needs to be a valid PostgreSQL identifier. Changing this forces a new resource to be created."
default=["m1047730db", "m1047730db1"]
}

variable "cluster_name" {
  description = "Name of the vnet to create"
  # default     = "m1047730-cluster1" 
}

variable "log_analytics_workspace_name"{
  default="m1047730LAW1"
}

variable "storage_account_name" {
  default = "m1047730scrstor"
}
## AKS kubernetes cluster variables ##
variable "container_registry_name" {
  default = "akscraname221"
}

variable "pre_defind_networkrules" {
  description = "Standard set of predefined rules"
  type        = "map"
  
  default = {
    
    dev = [{
        name                   = "SSH"
        priority               = "500"
        source_address_prefix  = ["10.0.3.0/24"]
      },
      {
        name                   = "LDAP"
        source_port_range      = "1024-1026"
      }]

   pro=[
      {
        name                   = "devnsgprdefinedrules"
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
}
variable "custom_defind_networkrules" {
  description = "Standard set of predefined rules"
  type        = "map"
  
  default = {
    
    dev = []

   pro=[
      
   ]
  
  }
}

variable "acr_storage_tier" {
  description = "Standard set of predefined rules"
  type        = "map"
  
  default = {
    
  dev = "Standard"

  pro="StandardPremium"
  
  }
}
variable "acr_account_replication_type" {
  
  type        = "map"
  
  default = {
    
  dev = "LRS"

  pro="GRS"
  
  }
}

variable "RandomnName" {
  
  type        = "map"
  
  default = {
    
  dev = "devaz"

  pro="proaz"
  
  }
}