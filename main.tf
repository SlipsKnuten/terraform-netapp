resource "azurerm_resource_group" "netapp_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "netapp-vnet"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.netapp_rg.location
  resource_group_name = azurerm_resource_group.netapp_rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "netapp-subnet"
  resource_group_name  = azurerm_resource_group.netapp_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix

  delegation {
    name = "netapp-delegation"
    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_netapp_account" "netapp_account" {
  name                = var.netapp_account_name
  location            = azurerm_resource_group.netapp_rg.location
  resource_group_name = azurerm_resource_group.netapp_rg.name
}

resource "azurerm_netapp_pool" "netapp_pool" {
  name                = var.netapp_pool_name
  location            = azurerm_resource_group.netapp_rg.location
  resource_group_name = azurerm_resource_group.netapp_rg.name
  account_name        = azurerm_netapp_account.netapp_account.name
  service_level       = "Standard"
  size_in_tb          = var.netapp_pool_size
}

resource "azurerm_netapp_volume" "netapp_volume" {
  name                = var.netapp_volume_name
  location            = azurerm_resource_group.netapp_rg.location
  resource_group_name = azurerm_resource_group.netapp_rg.name
  account_name        = azurerm_netapp_account.netapp_account.name
  pool_name           = azurerm_netapp_pool.netapp_pool.name
  volume_path         = "my-volume"
  service_level       = "Standard"
  storage_quota_in_gb = 100
  subnet_id           = azurerm_subnet.subnet.id
  protocols                  = ["NFSv4.1"]

  export_policy_rule {
    rule_index         = 1  # Required attribute
    allowed_clients    = ["0.0.0.0/0"]  # Change to a set of strings
    unix_read_only     = false
    unix_read_write    = true
  }
}

