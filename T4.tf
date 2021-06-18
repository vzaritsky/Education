provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mid" {
  name     = "rsg-mid"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "VNET01"
  resource_group_name = azurerm_resource_group.mid.name
  location            = azurerm_resource_group.mid.location
  address_space       = ["10.254.0.0/16"]
}

resource "azurerm_subnet" "frontend" {
  name                 = "subnet0"
  resource_group_name  = azurerm_resource_group.mid.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.254.0.0/24"]
}

resource "azurerm_public_ip" "mid" {
  name                = "mid-pip"
  resource_group_name = azurerm_resource_group.mid.name
  location            = azurerm_resource_group.mid.location
  allocation_method   = "Dynamic"
}

locals {
  backend_address_pool_name      = "${azurerm_virtual_network.vnet.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.vnet.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.vnet.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.vnet.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.vnet.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.vnet.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.vnet.name}-rdrcfg"
}

resource "azurerm_application_gateway" "network" {
  name                = "AppGw01"
  resource_group_name = azurerm_resource_group.mid.name
  location            = azurerm_resource_group.mid.location
