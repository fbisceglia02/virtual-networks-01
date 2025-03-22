# main.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

######################################
# Resource Group Resource Definition #
######################################

resource "azurerm_resource_group" "main" {
  name                      = var.resource_group_name
  location                  = var.location
}

#######################################
# Virtual Network Resource Definition #
#######################################

# resource "azurerm_network_security_group" "example" {
#   name                    = "example-security-group"
#   location                = azurerm_resource_group.example.location
#   resource_group_name     = azurerm_resource_group.example.name
# }

resource "azurerm_virtual_network" "main" {
  name                      = var.vnet_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.main.name
  address_space             = var.vnet_address_space # ["10.0.0.0/16"]
  dns_servers               = var.vnet_dns_servers # ["10.0.0.4", "10.0.0.5"]

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name                  = subnet.value.name
      address_prefix        = subnet.value.address_prefixes[0]
      security_group        = lookup(subnet.value, "security_group", null)
    }
  } 

  tags = {
    environment             = "Production"
  }
}

