#Read stdin as string
$jsonpayload = [Console]::In.ReadLine()

#Convert to JSON
$json = ConvertFrom-Json $jsonpayload

#Access JSON values
$resourceType = $json.resourceType
$resourceName = $json.resourceName
$resourceGroupName = $json.resourceGroupName
$role = $json.role
$serviceprincipalid = $json.servicePrincipalId


$checkrole = Get-AzureRmRoleAssignment -ServicePrincipalName $serviceprincipalid -ResourceGroupName $resourceGroupName -ResourceName $resourceName -ResourceType $resourceType -RoleDefinitionName $role

$roleexists = $checkrole | ConvertTo-Json

if (-not ([string]::IsNullOrEmpty($roleexists))) {
 
	'{"roleResult": "The role assignment already exists."}'
} else {

	$Result = New-AzureRmRoleAssignment -ApplicationId $serviceprincipalid -ResourceGroupName $resourceGroupName -ResourceName $resourceName -ResourceType $resourceType -RoleDefinitionName $role

	if ($?) {
  		'{"roleResult": "The role assignment assigned successfully."}'
	} else {
		'{"roleResult": "The role assignment already exists."}'
 		exit 1
	}
} 