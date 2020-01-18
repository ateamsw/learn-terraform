terraform {
  required_version = ">= 0.12"
  
  backend "azurerm" {
    environment = "public"
  }
}

provider "azurerm" {
  version = "=1.41.0"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group that will be created."
}

variable "container_name" {
  type        = string
  description = "The name of the container instance that will be created."
}

variable "location" {
  type        = string
  description = "The location region where the resource group will be created."
  default     = "westus2"
}

resource "azurerm_resource_group" "group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_group" "aci" {
  name                = var.container_name
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  ip_address_type     = "public"
  dns_name_label      = var.container_name
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "microsoft/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}

output "fqdn" {
  value = "https://${azurerm_container_group.aci.fqdn}"
}