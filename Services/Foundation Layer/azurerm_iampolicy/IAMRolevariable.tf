variable "IAM_Role_Scope" {

  description = "Specify the Scope of the IAM Role"

  default     = "/subscriptions/2a037a4a-5098-4d7b-989d-a0d8991dd035/resourceGroups/RGKailash/"

}



variable "role_definition_name" {

  description = "Specify the role definition name. value like Reader,Contributor etc.. "

  default     = "Reader"

}



variable "principal_id" {

  description = "Specify the User/Group/Service Principle Id"

  default     = "90ff50f4-6f3d-4a56-b7ba-6f736ad6d1f7"

}

