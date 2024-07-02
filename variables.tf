variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "my-resource-group"
}

variable "location" {
  description = "Azure location/region"
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  default     = "my-vnet"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "my-subnet"
}

variable "route_table_name" {
  description = "Name of the route table"
  default     = "my-route-table"
}

variable "route_name" {
  description = "Name of the route"
  default     = "my-route"
}

variable "address_prefix" {
  description = "Address prefix for the route"
  default     = "10.0.2.0/24"
}

variable "next_hop_type" {
  description = "Next hop type for the route"
  default     = "Internet"
}
