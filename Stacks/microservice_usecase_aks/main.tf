provider "azurerm" {
    subscription_id = "${var.subscription_id}"
    tenant_id = "${var.tenant_id}"
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
}

# Creating virual network

variable "environment" {
  description = "environment " 
  default     = "dev"  
}
variable "Deploymentsize" {
  description = "deployment size(Small,Large,Medium) " 
  default     = "Small"  
}

module "KnownConfigurations" {
  # source = "../New Folder"
 source="../../Services/Foundation Layer/AzureDeploy-KnownConfigurations"
 deplomentsize="${var.Deploymentsize}"
}
module "vnetRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="PARENT"
  resource_type="vnet"
}

module "vnet" {   
  source="../../Services/Foundation Layer/azurerm_virtual_network"    
  vnet_name                = "${var.vnet_name}"
  location            = "${var.location}"
  address_space       = "${var.address_space}"
  resource_group_name = "${var.resource_group_name}"
  dns_servers         = "${var.dns_servers}"
  subnets_list="${var.subnets_list}"
  nsg_predefined_rules="${var.pre_defind_networkrules["${var.environment}"]}"
  nsg_custom_rules="${var.custom_defind_networkrules["${var.environment}"]}"    
}

# Assign IAM Role Access for vnet
module "azurerm_vnet_iam_role_assign" {
  source = "../../Services/azurerm_iam_role"  
  resource_name = "${module.vnet.vnet_name}"
  resource_group_name = "${var.resource_group_name}"
  service_principal_id = "${var.client_id}"
  account_type = "Microsoft.Network/virtualNetworks"
  role="Reader"
}

module "clusterRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="aks"
  resource_type="cluster"
}

# Creating kubernet cluster
module "azurerm_kubernetes_cluster" {
  source = "../../Services/azurerm_kubernetes_cluster"
  resource_group_name="${var.resource_group_name}"
  location="${var.location}"
  subnet_id="${module.vnet.vnet_subnets[0]}"
  cluster_name="${var.cluster_name}"
  log_analytics_workspace_name="${var.log_analytics_workspace_name}"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  agentpool_vm_size="${lookup(module.KnownConfigurations.ConfigurationsValue["kubernetesClusterSettings"],"clusterWorkerNodeSize")}"
  agent_count="${lookup(module.KnownConfigurations.ConfigurationsValue["kubernetesClusterSettings"],"nodecount")}"
}

# Assign IAM Role Access for aks cluster
module "azurerm_aks_cluster_iam_role_assign" {
  source = "../../Services/azurerm_iam_role"  
  resource_name = "${module.azurerm_kubernetes_cluster.aks_clustername}"
  resource_group_name = "${var.resource_group_name}"
  service_principal_id = "${var.client_id}"
  account_type="Microsoft.ContainerService/managedClusters"
  role="Reader"
}

module "acrRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="acr"
  resource_type="aksacr"
}
module "storageaccRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="acc"
  resource_type="storage"
}


#creating container registry
module "azurerm_container_registry" {
  source = "../../Services/azurerm_container_registry"
  container_registry_name="${module.acrRandomnName.result}"
  resource_group_name="${var.resource_group_name}"
  location="${var.location}"  
  storage_account_name="${module.storageaccRandomnName.result}"
  account_tier="${lookup(module.KnownConfigurations.ConfigurationsValue["storageaccountsettings"],"account_tier")}"
  account_replication_type = "${lookup(module.KnownConfigurations.ConfigurationsValue["storageaccountsettings"],"account_replication_type")}"
}

module "appgatewayRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="my"
  resource_type="appgateway"
}

module "appgatewayPipRandomnName" {
  source = "../../Services/azure_randomn_name"
 environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="pip"
  resource_type="appgateway"
}

#creating application gateway 
module "azurerm_application_gateway" {
  source = "../../Services/azurerm_application_gateway_path_based"
  app_gateway_resource_group_name="${var.resource_group_name}"
  app_gateway_location="${var.location}"
  app_gateway_ip_config_vnet_id="${module.vnet.vnet_id}"
  app_gateway_ip_config_subnet_name="${module.vnet.vnet_subnets_name[1]}"
  app_gateway_vnet_name="${module.vnet.vnet_name}"
  app_gateway_aks_cluster_name="${module.azurerm_kubernetes_cluster.aks_clustername}"
  app_gateway_name = "${module.appgatewayRandomnName.result}"
  app_gateway_public_ip_name = "${module.appgatewayPipRandomnName.result}"
}

module "postgreServerRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="my"
  resource_type="postgreserver"
}

#creating postgre sql server
module "azurerm_postgresql_server" {
  source ="../../Services/azurerm_postgresql_server"    
  resource_group_name="${var.resource_group_name}"
  location="${var.location}"
  server_name="${var.postgresql_server_name}"
  subnet_vnet_id="${module.vnet.vnet_subnets[0]}"  
  db_names="${var.db_names}"
  sku_name="${lookup(module.KnownConfigurations.ConfigurationsValue["postgresqlSettings"],"skuName")}"
  sku_capacity="${lookup(module.KnownConfigurations.ConfigurationsValue["postgresqlSettings"],"skuCapacityvCore")}"
  sku_tier="${lookup(module.KnownConfigurations.ConfigurationsValue["postgresqlSettings"],"skuTier")}"  
  sku_family="${lookup(module.KnownConfigurations.ConfigurationsValue["postgresqlSettings"],"skuFamily")}"
}


#Creating Application Insights
module "applicationinsightsRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="my"
  resource_type="ApplicationInsights"
}

#creating Application Insights
module "azurerm_application_insights" {
  source ="../../Services/azurerm_application_insights"    
  resource_group_name="${var.resource_group_name}"
  location="${var.location}"
  Appication_insights_name="${module.applicationinsightsRandomnName.result}"  
}

#Creating Application Service  Random name
module "applicationserviceRandomnName" {
  source = "../../Services/azure_randomn_name"
  environment_name="${var.RandomnName["${var.environment}"]}"
  resource_prefix="my"
  resource_type="Appservice"
}

#creating Application Service
module "azurerm_app_service" {
  source ="../../Services/azurerm_app_service"    
  resource_group_name="${var.resource_group_name}"
  location="${var.location}"
  app_service_plan_sku_tier="${lookup(module.KnownConfigurations.ConfigurationsValue["appserviceSettings"],"skuTier")}"
  app_service_plan_sku_size="${lookup(module.KnownConfigurations.ConfigurationsValue["appserviceSettings"],"skuSize")}"
  appinsights_instrumentationkey="${module.azurerm_application_insights.webapp_key}" 
  application_name="${module.applicationserviceRandomnName.result}"  
}



