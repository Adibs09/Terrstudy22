module "rg1" {
  source = "./rg"
  rg_name = "deep-rg1"
}

module "rg2" {
  source = "./rg"
  rg_name = "deep-rg2"
  rg_location = "eastus2"
}

resource "azurerm_public_ip" "example4" {
  name                = "Deep-data-ip2"
  resource_group_name = module.rg1.rgname
  location            = module.rg1.rgloc
  allocation_method   = "Static"
  tags = {
    environment = "Production"
  }
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.1.0"
 resource_group_name = module.rg2.rgname
 use_for_each = false
 vnet_location = module.rg2.rgloc
}