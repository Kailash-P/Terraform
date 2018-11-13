variable "resource_group_name" {
    description=""
    default="M1047593RG"  
}
variable "location" {
    description=""
    default="Central India"  
}

variable "server_name" {
description="Enter the Server name"
default="kannansql"

  
}
variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
  default     = "GP_Gen5_2"
}

variable "sku_capacity" {
  description = "The scale up/out capacity, representing server's compute units"
  default     = "2"
}

variable "sku_tier" {
  description = "The tier of the particular SKU. Possible values are Basic, GeneralPurpose, and MemoryOptimized."
  default     = "GeneralPurpose"
}

variable "sku_family" {
  description = " The family of hardware Gen4 or Gen5."
  default     = "Gen5"
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  default     = 51200
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = 7
}

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  default     = "Disabled"
}

variable "administrator_login" {
  description = "The Administrator Login for the PostgreSQL Server. Changing this forces a new resource to be created."
  default="M1047593"
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
  default="Mishitha@19"
}

variable "server_version" {
  description = "Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, and 10.0. Changing this forces a new resource to be created."
  default     = "9.6"
}

variable "ssl_enforcement" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
  default     = "Enabled"
}

variable "db_names" {
  description = "The list of names of the PostgreSQL Database, which needs to be a valid PostgreSQL identifier. Changing this forces a new resource to be created."
default=["kannandb1", "kannandb2"]
}

variable "db_charset" {
  description = "Specifies the Charset for the PostgreSQL Database, which needs to be a valid PostgreSQL Charset. Changing this forces a new resource to be created."
  default     = "UTF8"
}

variable "db_collation" {
  description = "Specifies the Collation for the PostgreSQL Database, which needs to be a valid PostgreSQL Collation. Note that Microsoft uses different notation - en-US instead of en_US. Changing this forces a new resource to be created."
  default     = "English_United States.1252"
}

variable "firewall_rule_prefix" {
  description = "Specifies prefix for firewall rule names."
  default     = "firewall-"
}

variable "firewall_rules" {
  description = "The list of maps, describing firewall rules. Valid map items: name, start_ip, end_ip."
  default     = [
        {name="kannanpost", start_ip="10.0.0.5", end_ip="10.0.0.8"},
        {start_ip="127.0.0.0", end_ip="127.0.1.0"}]
        }


variable "vnet_rule_name_prefix" {
  description = "Specifies prefix for vnet rule names."
  default     = "postgresql-vnet-rule"
}

variable "subnet_vnet_id" {  
  description = "Specifies subnet_id for Vnet Rule."
  default="/subscriptions/2a037a4a-5098-4d7b-989d-a0d8991dd035/resourceGroups/M1047540RG/providers/Microsoft.Network/virtualNetworks/azurevnet/subnets/default"
}









