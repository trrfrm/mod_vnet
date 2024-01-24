resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_details.name
    location            = var.az_rg.location
    resource_group_name = var.az_rg.name
    address_space       = var.vnet_details.address_space
    
    depends_on          = [
      azurerm_resource_group.my_rsg
    ]
}

resource "azurerm_subnet" "subnets" {
    count                = length(var.subnet_names)
    name                 = var.subnet_names[count.index]
    virtual_network_name = var.vnet_details.name
    resource_group_name  = var.az_rg.name
    address_prefixes     = [ cidrsubnet(var.vnet_details.address_space[0],8,count.index)]
    
    depends_on           = [
        azurerm_resource_group.my_rsg,
        azurerm_virtual_network.vnet
    ]
}