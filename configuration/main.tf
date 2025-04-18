

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


module "vnet" {
  source  = "app.terraform.io/terraformforge/vnet/arm"
  version = "0.0.2"

  resource_group_name       = azurerm_resource_group.main.name
  vnet_name                 = var.vnet_name
  vnet_address_space        = var.vnet_address_space
  vnet_dns_servers          = var.vnet_dns_servers
  subnets                   = var.subnets
  tags                      = var.tags

  credentials "app.terraform.io" {
    # valid user API token
    token = "vuK3znfXHSTuTA.atlasv1.  fvtm6KFVj7SiPo9mkR2ik2pw1EWY8yuNOi8jX2YqLUW6QwJfUqxzCddhL7rP0OziDR8"
  }
}



# resource "azurerm_virtual_network" "main" {
#   name                      = var.vnet_name
#   location                  = var.location
#   resource_group_name       = azurerm_resource_group.main.name
#   address_space             = var.vnet_address_space # ["10.0.0.0/16"]
#   dns_servers               = var.vnet_dns_servers # ["10.0.0.4", "10.0.0.5"]

#   dynamic "subnet" {
#     for_each = var.subnets
#     content {
#       name                  = subnet.value.name
#       address_prefix        = subnet.value.address_prefixes[0]
#       security_group        = lookup(subnet.value, "security_group", null)
#     }
#   } 

#   tags = {
#     environment             = "Production"
#   }
# }

