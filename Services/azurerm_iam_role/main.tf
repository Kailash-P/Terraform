data "external" "powershell_test" {
  program = ["Powershell.exe", "${var.file_path}"]
  query = {
    resourceType = "${var.account_type}"
    resourceName = "${var.resource_name}"
    resourceGroupName = "${var.resource_group_name}"
    role="${var.role}"
    servicePrincipalId = "${var.service_principal_id}"
  }
}