# resource "azurerm_resource_group" "aksa" {
#   name     = "${var.resource_group_name}"
#   location = "${var.location}"
# }

# resource azurerm_network_security_group "aksa_advanced_network" {
#   name                = "${var.network_security_group_name}"
#   location            = "${var.location}"
#   resource_group_name = "${var.resource_group_name}"
# }

# resource "azurerm_virtual_network" "aksa_advanced_network" {
#   name                = "${var.virtual_network_name}"
#   location            = "${var.location}"
#   resource_group_name = "${var.resource_group_name}"
#   address_space       = ["${var.vnet_address_space}"]
# }

# resource "azurerm_subnet" "aksa_subnet" {
#   name                      = "${var.subnet_name}"
#   resource_group_name       = "${var.resource_group_name}"
#   network_security_group_association = "${azurerm_network_security_group.aksa_advanced_network.id}"
#   address_prefix            = "${var.subnet_address_prefix}"
#   virtual_network_name      = "${azurerm_virtual_network.aksa_advanced_network.name}"
# }

resource "azurerm_log_analytics_workspace" "aksa" {
  name                = "${var.log_analytics_workspace_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.aks_sku}"
}

resource "azurerm_log_analytics_solution" "aksa" {
  solution_name         = "${var.solution_name}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  workspace_resource_id = "${azurerm_log_analytics_workspace.aksa.id}"
  workspace_name        = "${azurerm_log_analytics_workspace.aksa.name}"

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

## Private key for the kubernetes cluster ##
resource "tls_private_key" "key" {
  algorithm   = "RSA"
}

## Save the private key in the local workspace ##
resource "null_resource" "save-key" {
  triggers {
    key = "${tls_private_key.key.private_key_pem}"
  }

#   provisioner "local-exec" {
#     command = <<EOF
#       mkdir -p ${path.module}/.ssh     
#       chmod 0600 ${path.module}/.ssh/id_rsa
# EOF
#   }
}

resource "azurerm_kubernetes_cluster" "aksa" {
  name       = "${var.cluster_name}"
  location   = "${var.location}"
  dns_prefix = "${var.dns_prefix}"

  resource_group_name = "${var.resource_group_name}"

  # linux_profile   {
  #   admin_username = "${var.admin_username}"

  #   ssh_key {
  #     key_data = "${trimspace(tls_private_key.key.public_key_openssh)} ${var.admin_username}@azure.com" 
  #   }
  # }

  agent_pool_profile {
    name    = "${var.agentpool_name}"
    count   = "${var.agent_count}"
    vm_size = "${var.agentpool_vm_size}"
    os_type = "${var.agentpool_vm_os_type}"

    # Required for advanced networking
    vnet_subnet_id = "${var.subnet_id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.aksa.id}"
    }
  }

  network_profile {
    network_plugin = "azure"
  }
}