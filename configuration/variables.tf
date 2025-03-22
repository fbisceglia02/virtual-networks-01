################################
# General Variable Definitions #
################################

variable "location" {
  type                  = string
  description           = "Name of the location for deployed Azure Resources"
}
variable "second_location" {
  type                  = string
  description           = "Name of the location for deployed Azure Resources"
}
variable "third_location" {
  type                  = string
  description           = "Name of the location for deployed Azure Resources"
}

#######################################
# Resource Group Variable Definitions #
#######################################

variable "resource_group_name" {
  type                  = string
  description           = "Name of the resource group containing the lab resources"
}

########################################
# Virtual Network Variable Definitions #
########################################

variable "vnet_name" {
  type                  = string
  description           = ""
}

variable "vnet_address_space" {
  type                  = list(string)
  description           = ""
}

variable "vnet_dns_servers" {
  type                  = list(string)
  description           = ""
}

variable "subnets" {
  description           = "Lista degli oggetti Subnet da creare"
  type                  = list(object({
    name             = string
    address_prefixes = list(string)
    security_group   = optional(string)
  }))
  default = []
}


variable "tags" { 
  description           = "tags"
  type                  = map(string)
}