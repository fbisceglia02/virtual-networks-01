###########################
# General Variable Values #
###########################

location                            = "italynorth"

##################################
# Resource Group Variable Values #
##################################

resource_group_name                 = "virtual-networks-01"

# ###################################
# # Virtual Network Variable Values #
# ###################################

vnet_name                           = "CoreServicesVnet"

vnet_address_space                  = ["10.20.0.0/16"]

vnet_dns_servers                    = ["10.0.0.4", "10.0.0.5"]

subnets = [ 
    {
        name                        = "GatewaySubnet"
        address_prefixes            = [ "10.20.0.0/27" ]
    },
    {
        name                        = "DatabaseSubnet"
        address_prefixes            = [ "10.20.20.0/24" ]
    }, 
    {
        name                        = "SharedServicesSubnet"
        address_prefixes            = [ "10.20.10.0/24" ]
    },
    {
        name                        = "PublicWebServiceSubnet"
        address_prefixes            = [ "10.20.30.0/24" ]
    }
]
