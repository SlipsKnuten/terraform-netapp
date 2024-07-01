variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "The address prefix of the subnet."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "netapp_account_name" {
  description = "The name of the NetApp account."
  type        = string
}

variable "netapp_pool_name" {
  description = "The name of the NetApp pool."
  type        = string
}

variable "netapp_volume_name" {
  description = "The name of the NetApp volume."
  type        = string
}

variable "netapp_pool_size" {
  description = "The size of the NetApp pool in TB."
  type        = number
  default     = 4
}

variable "active_directory_dns" {
  description = "The DNS servers of the Active Directory."
  type        = list(string)
}

variable "active_directory_domain" {
  description = "The domain of the Active Directory."
  type        = string
}

variable "active_directory_username" {
  description = "The username for the Active Directory admin."
  type        = string
}

variable "active_directory_password" {
  description = "The password for the Active Directory admin."
  type        = string
  sensitive   = true
}

variable "organizational_unit" {
  description = "The organizational unit in the Active Directory."
  type        = string
}

variable "active_directory_site" {
  description = "The site of the Active Directory."
  type        = string
}
