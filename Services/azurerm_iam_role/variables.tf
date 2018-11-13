variable "file_path" {
    type="string"
    description="Enter the powershell file path"
    default="../../Services/azurerm_iam_role/Powershell_Scripts/add_role_for_azure_resource.ps1"
}
variable "account_type" {
    type="string"
    default="Microsoft.Network/virtualNetworks"
}

variable "resource_name" {
    type="string"
    default="azurevnet"
}

variable "resource_group_name" {
    type="string"
    default="M1047593RG"
}

variable "role" {
    type="string"
    default="Reader"
}

variable "service_principal_id" {
    type="string"
    default="297b9274-5c60-45a0-b6b6-dc11a23e63b9"
}