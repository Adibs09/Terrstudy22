module "rg3" {
  source = "./rg"
  rg_name = "deep-rg3"
}

module "rg4" {
  source = "./rg"
  rg_name = "deep-rg4"
  rg_location = "eastus2"
}