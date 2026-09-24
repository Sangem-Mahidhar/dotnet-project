terraform {
   required_providers {
     azurerm= {
        source = "hashicorp/azurerm"
        version = ">=4.0.0"
     }
   }

  backend "azurerm" {
        resource_group_name  = "NetflixRG"
        storage_account_name = "netflixsa2001"
        container_name       = "new"
        key                  = "terraform.tfstate"
   }
}

provider "azurerm" {
  features {}
}