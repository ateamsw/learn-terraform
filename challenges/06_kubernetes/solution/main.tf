terraform {
  required_version = ">= 0.12"
  
  backend "azurerm" {
    environment = "public"
  }
}

provider "azurerm" {
  version = "=1.41.0"
}

provider "azuread" {
  version = "=0.7.0"
}

# Define Kubernetes provider to use the AKS cluster
provider "kubernetes" {
  version = "1.10"
  host                   = azurerm_kubernetes_cluster.aks.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
}

variable "name_prefix"       { }
variable "name_base"         { }
variable "name_suffix"       { }
variable "location"          { }
variable "node_count"        { }
variable "aks_version"       { }

locals {
  base_name  = "${var.name_prefix}-${var.name_base}-${var.name_suffix}"
}

resource "azurerm_resource_group" "group" {
  name     = "${local.base_name}-rg"
  location = var.location
}

module "service_principal" {
  source    = "./service-principal"
  base_name = local.base_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${local.base_name}-aks"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  dns_prefix          = local.base_name
  kubernetes_version  = var.aks_version

  default_node_pool {
    name       = "linux01"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
    type       = "VirtualMachineScaleSets"
  }

  service_principal {
    client_id     = module.service_principal.client_id
    client_secret = module.service_principal.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  depends_on = [
    module.service_principal.client_id
  ]
}