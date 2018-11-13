## Azure config variables ##
variable "client_id" {
    default = "297b9274-5c60-45a0-b6b6-dc11a23e63b9"
}  

variable "client_secret" {
  default = "PnRtlDisFNaZzA1u9aSfpgqFTY1+72TI7XuRUTuOTEI="
}

variable "subnet_id" {
  default = "subnet1"
}

variable "location" {
  default = "East US"
}

## Resource group variables ##
variable "resource_group_name" {
  default = "m1047542"
}

## Advanced network settings variables ##
variable "network_security_group_name"{
  default = "m1047542-1-nsg"
}

variable "virtual_network_name" {
  default = "m1047542-1-vnet"
}

variable "vnet_address_space" {
  default = "10.1.0.0/16"
}

variable "subnet_name" {
  default = "m1047542-1-subnet"
}

variable "subnet_address_prefix"{
 default = "10.1.0.0/24" 
}

variable "log_analytics_workspace_name"{
  default="m1047542LAW1"
}

## AKS kubernetes cluster variables ##
variable "cluster_name" {
  default = "m1047542-cluster1"
}

variable "agent_count" {
  default = 2
}

variable "dns_prefix" {
  default = "m1047542-cluster1"
}

variable "admin_username" {
    default = "m1047542-user1"
}
variable "solution_name" {
  default="ContainerInsights"
}
variable "aks_sku" {
  default="PerGB2018"
  
}
variable "agentpool_name" {
  default="agentpool"
}
variable "agentpool_vm_size" {
  default="Standard_D2"
}
variable "agentpool_vm_os_type" {
  default="Linux"
}
