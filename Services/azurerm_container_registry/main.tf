data "azurerm_resource_group" "acr" {
  name = "${var.resource_group_name}"
}
## To create new storage account ##
 resource "azurerm_storage_account" "acr" {
   name                     = "${var.storage_account_name}"
   resource_group_name      = "${var.resource_group_name}"
   location                 = "${var.location}"
   account_tier             = "${var.account_tier}"
   account_replication_type = "${var.account_replication_type}"
 }

## create new ACR ##
 resource "azurerm_container_registry" "acr" {
   name                = "${var.container_registry_name}"
   resource_group_name = "${var.resource_group_name}"
   location            = "${var.location}"
   admin_enabled       = true
   sku                 = "Classic"
   storage_account_id  = "${azurerm_storage_account.acr.id}"
 }

# ## Data existing Storage account ##
# data "azurerm_storage_account" "acr" {
#   name                 = "${var.storage_account_name}"
#   resource_group_name  = "${var.resource_group_name}"  
# }

# ## cretae new ACR ##
# resource "azurerm_container_registry" "acr" {
#   name                = "${var.container_registry_name}"
#   resource_group_name = "${data.azurerm_resource_group.acr.name}"
#   location            = "${data.azurerm_resource_group.acr.location}"
#   admin_enabled       = true
#   sku                 = "Classic"
#   storage_account_id  = "${data.azurerm_storage_account.acr.id}"
# }