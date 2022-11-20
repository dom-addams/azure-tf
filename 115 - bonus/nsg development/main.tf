# Module blocks -- repeat with lists and iterate

/*
# Variable for Module 1
variable "my_ports" {
  type    = list(number)
  default = [80]
}

# NSG Module
module "nsg_rules_module_1" {
  source   = "./nsg - v1"
  nsg_name = "nsg-one"
  rg       = "terraform-resources-rg"
  location = "UK South"

  # Dynamic Block -- v1
  interator             = var.my_ports
  rule_name             = "allow-http"
  rule_priorty          = "110"
  rule_direction        = "Inbound"
  rule_access           = "Allow"
  rule_protocol         = "TCP"
  rule_source_port      = "*"
  rule_destination_port = "80"
  rule_source_ip        = "*"
  rule_destination_ip   = "*" # VM IP
}*/

/*
### MODULE V2 FOR TF V13 ###
# Varaible for Module 2
variable "nsg_rules" {
  type = list(object({
    rule_name             = string
    rule_priorty          = string
    rule_direction        = string
    rule_access           = string
    rule_protocol         = string
    rule_source_port      = string
    rule_destination_port = string
    rule_source_ip        = string
    rule_destination_ip   = string
  }))
  default = [
    {
      rule_name             = "allow-http"
      rule_priorty          = "110"
      rule_direction        = "Inbound"
      rule_access           = "Allow"
      rule_protocol         = "TCP"
      rule_source_port      = "*"
      rule_destination_port = "80"
      rule_source_ip        = "*"
      rule_destination_ip   = "*"
    },
    {
        rule_name             = "allow-https"
        rule_priorty          = "120"
        rule_direction        = "Inbound"
        rule_access           = "Allow"
        rule_protocol         = "TCP"
        rule_source_port      = "*"
        rule_destination_port = "443"
        rule_source_ip        = "*"
        rule_destination_ip   = "*"
    }
  ]
}

# NSG Module 2
module "nsg_rules_module_2" {
  source   = "./nsg - v2"
  nsg_name = "nsg-two"
  rg       = "terraform-resources-rg"
  location = "UK South"

  # Dynamic Block -- v2
  ## Store values in list object var to pass into dynamic block
  ## The object type constructor requires one argument specifying the attribute types and values as a map
  ## TF V0.13 allows Count/For_each in modules which makes interating more efficient for multiple rules 
  for_each              = var.nsg_rules
  rule_name             = each.value.rule_name
  rule_priorty          = each.value.rule_priorty
  rule_direction        = each.value.rule_direction
  rule_access           = each.value.rule_access
  rule_protocol         = each.value.rule_protocol
  rule_source_port      = each.value.rule_source_port
  rule_destination_port = each.value.rule_destination_port
  rule_source_ip        = each.value.rule_source_ip
  rule_destination_ip   = each.value.rule_destination_ip
}
*/

### MODULE REFERENCE LINKS ###
# 1) https://github.com/Azure/terraform-azurerm-network-security-group/blob/master/variables.tf
# 2) https://github.com/Azure/terraform-azurerm-network-security-group/blob/master/rules.tf
# 3) https://github.com/Azure/terraform-azurerm-network-security-group/blob/master/modules/ActiveDirectory/main.tf
# 4) https://github.com/Azure/terraform-azurerm-network-security-group/blob/master/main.tf 

# NSG Module 3
# module "nsg_rules_module_3" {
#   source   = "./nsg - v3"
#   nsg_name = "nsg-three"
#   rg       = "terraform-resources-rg"
#   location = "UK South"

#   # Dynamic Block -- v3
#   # list to reference rule names   
#   predefined_rules = [
#     {
#       name = "http"
#     },
#     {
#       name = "https"
#     },
#     {
#       name = "rdp"
#     }
#   ]



#   ## TF V0.13 allows Count/For_each in modules which makes interating more efficient for multiple rules 
#   count                 = length(var.predefined_rules)
#   rule_name             = lookup(var.predefined_rules[count.index], "name")
#   rule_priorty          = lookup(var.predefined_rules[count.index], "name")
#   rule_direction        = lookup(var.predefined_rules[count.index], "name")
#   rule_access           = lookup(var.predefined_rules[count.index], "name")
#   rule_protocol         = lookup(var.predefined_rules[count.index], "name")
#   rule_source_port      = lookup(var.predefined_rules[count.index], "name")
#   rule_destination_port = lookup(var.predefined_rules[count.index], "name")
#   rule_source_ip        = lookup(var.predefined_rules[count.index], "name")
#   rule_destination_ip   = lookup(var.predefined_rules[count.index], "name")

# }
