variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where resources will be created"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
}

variable "route_table_name" {
  description = "The name of the Route Table"
  type        = string
}

variable "route_name" {
  description = "The name of the Route"
  type        = string
}

variable "address_prefix" {
  description = "The address prefix for the route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "next_hop_type" {
  description = "The type of Azure hop the packet should be sent to"
  type        = string
  default     = "Internet"
}
