
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

resource "azurerm_storage_account" "terraform_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.terraform_rg.name
  location                 = azurerm_resource_group.terraform_rg.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
}
