output "vnet_id" {
  value = azurerm_virtual_network.my_vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.my_subnet.id
}

output "route_table_id" {
  value = azurerm_route_table.my_route_table.id
}

output "route_id" {
  value = azurerm_route.my_route.id
}

output "route_table_association_id" {
  value = azurerm_subnet_route_table_association.my_route_table_association.id
}
