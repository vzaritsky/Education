provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mid" {
  name     = "rsg-mid"
  location = "West Europe"
}

resource "azurerm_storage_account" "mid" {
  name                     = "CorpStorage01"
  resource_group_name      = azurerm_resource_group.mid.name
  location                 = azurerm_resource_group.mid.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}
