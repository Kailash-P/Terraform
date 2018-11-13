variable "resource_group_name" {
    description=""
    default="M1047730RG"  
}
variable "location" {
    description=""
    default="East US"  
}
variable "application_name" {
    description=""
    default="FirstTerraapp1"  
}

variable "app_service_plan_sku_tier" {
  description = "The tier of the particular SKU"
  default     = "Free"
}

variable "app_service_plan_sku_size" {
  description = " The family of hardware Gen4 or Gen5."
  default     = "F1"
}

variable "appinsights_instrumentationkey" {
  description = "Enter Application insights instrumentation key"
  default     = ""
}
