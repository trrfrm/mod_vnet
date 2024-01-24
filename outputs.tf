output "location" {
    value = azurerm_resource_group.my_rsg.location
}

output "vnet_name" {
    value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
}

output "subnet_counts" {
    value = length(azurerm_subnet.subnets)
}
