variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure location/region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}

variable "route_name" {
  description = "Name of the route"
  type        = string
}

variable "netapp_pool_name" {
  description = "Name of the NetApp pool"
  type        = string
}

variable "netapp_volume_name" {
  description = "Name of the NetApp volume"
  type        = string
}

variable "netapp_capacity_pool_size" {
  description = "Size of the NetApp pool"
  type        = number
}

variable "netapp_volume_size" {
  description = "Size of the NetApp volume"
  type        = number
}
