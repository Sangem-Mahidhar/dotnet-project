terraform {
   required_providers {
     azurerm= {
        source = "hashicorp/azurerm"
        version = ">=4.0.0"
     }
   }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
    name = var.azure_resource_group
    location = var.location
}

resource "azurerm_service_plan" "ASP" {
    name = var.ASP_Name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    os_type = "Windows"
    sku_name = "B1" 
}

resource "azurerm_windows_web_app" "nfwebapp" {
    name = var.APP_Name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    service_plan_id = azurerm_service_plan.ASP.id
    site_config {
        always_on = false
    }
  
}
