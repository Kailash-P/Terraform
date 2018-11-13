variable "location" {
  default = "East US"
}

## Resource group variables ##
variable "resource_group_name" {
  default = "m1047542"
}

## Storage variables ##
variable "storage_account_name" {
  default = "iraistoaccacr"
}

## AKS kubernetes cluster variables ##
variable "account_tier" {
  default = "Standard"
}
variable "account_replication_type" {
  default = "LRS"
}

## AKS kubernetes cluster variables ##
variable "container_registry_name" {
  default = "iraiacr1"
}