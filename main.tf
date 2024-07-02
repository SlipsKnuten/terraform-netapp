resource "azurerm_resource_group" "my_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "my_vnet" {
  depends_on = [azurerm_resource_group.my_resource_group]
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
  
}

resource "azurerm_subnet" "my_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  delegation {
    name = "netapp-volumes"
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
    }
  }
}

resource "azurerm_route_table" "my_route_table" {
  depends_on = [azurerm_resource_group.my_resource_group]
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "my_route" {
  name                   = var.route_name
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.my_route_table.name
  address_prefix         = "0.0.0.0/0"  # This directs all traffic to the Internet
  next_hop_type          = "Internet"
}

resource "azurerm_subnet_route_table_association" "my_route_table_association" {
  subnet_id      = azurerm_subnet.my_subnet.id
  route_table_id = azurerm_route_table.my_route_table.id
}

data "azurerm_client_config" "current" {
}

resource "azurerm_user_assigned_identity" "example" {
  name                = "anf-user-assigned-identity"
  location            = azurerm_resource_group.my_resource_group.location
  resource_group_name = azurerm_resource_group.my_resource_group.name
}

resource "azurerm_netapp_account" "example" {
  name                = "netapp-account"
  location            = azurerm_resource_group.my_resource_group.location
  resource_group_name = azurerm_resource_group.my_resource_group.name

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.example.id
    ]
  }
}

resource "azurerm_netapp_pool" "example_pool" {
  name                 = var.netapp_pool_name
  location             = azurerm_resource_group.my_resource_group.location
  resource_group_name  = azurerm_resource_group.my_resource_group.name
  account_name         = azurerm_netapp_account.example.name
  service_level        = "Premium" # or "Standard", "Ultra"
  size_in_tb        = var.netapp_capacity_pool_size
}

resource "azurerm_netapp_volume" "example_volume" {
  name                 = var.netapp_volume_name
  location             = azurerm_resource_group.my_resource_group.location
  resource_group_name  = azurerm_resource_group.my_resource_group.name
  account_name         = azurerm_netapp_account.example.name
  pool_name            = azurerm_netapp_pool.example_pool.name
  volume_path          = var.netapp_volume_name
  service_level        = "Premium" # or "Standard", "Ultra"
  protocols            = ["NFSv3"]
  subnet_id            = azurerm_subnet.my_subnet.id
  storage_quota_in_gb = var.netapp_volume_size
}
