terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0, < 4.0.0" # Pinning to a stable major version
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
}