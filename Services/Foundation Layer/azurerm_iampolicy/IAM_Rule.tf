resource "azurerm_role_assignment" "IAM_Role" {
  scope                = "${var.IAM_Role_Scope}"
  role_definition_name = "${var.role_definition_name}"
  principal_id         = "${var.principal_id}"
  
}