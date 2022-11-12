module "rg_module" {
  source = "./sub-folder"
  rg_name = "terraform-module-rg"
  location = "UK South"
}

module "rg_module_2" {
  source = "./sub-folder"
  rg_name = "second-module-rg"
  location = "UK South"
}

output "module_output" {
  value = module.rg_module.rg_id_output
}