# deinfing modules
module "nsg_module" {
  source = "./NSG"
  nsg_name = "module-nsg"
  location = "UK South"
  rg = "terraform-resources-rg"
}

module "nsg_rule_one" {
  source = "./Rules"
  rule_name = "allow-http"
  rule_priority = "110"
  rule_direction = "Inbound"
  rule_access = "Allow"
  rule_protocol = "Tcp"
  rule_source_port = "*"
  rule_destination_port = "80"
  rule_source_ip = "*"
  rule_destination_ip = "*"
  rg = "terraform-resources-rg"
  nsg = module.nsg_module.nsg_name_output
}

module "nsg_rule_two" {
  source = "./Rules"
  rule_name = "allow-https"
  rule_priority = "120"
  rule_direction = "Inbound"
  rule_access = "Allow"
  rule_protocol = "Tcp"
  rule_source_port = "*"
  rule_destination_port = "443"
  rule_source_ip = "*"
  rule_destination_ip = "*"
  rg = "terraform-resources-rg"
  nsg = module.nsg_module.nsg_name_output
}

module "nsg_rule_three" {
  source = "./Rules"
  rule_name = "allow-rdp"
  rule_priority = "130"
  rule_direction = "Inbound"
  rule_access = "Allow"
  rule_protocol = "Tcp"
  rule_source_port = "*"
  rule_destination_port = "3389"
  rule_source_ip = "*"
  rule_destination_ip = "*"
  rg = "terraform-resources-rg"
  nsg = module.nsg_module.nsg_name_output
}

output "nsg_module_output" {
  value = module.nsg_module.nsg_name_output
}