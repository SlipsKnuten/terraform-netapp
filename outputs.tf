output "resource_group_name" {
  value = azurerm_resource_group.my_resource_group.name
}

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

output "netapp_account_id" {
  value = azurerm_netapp_account.example.id
}

output "netapp_pool_id" {
  value = azurerm_netapp_pool.example_pool.id
}

output "netapp_volume_id" {
  value = azurerm_netapp_volume.example_volume.id
}
