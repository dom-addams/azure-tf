# Variables files

### general parameters ##
variable "location" {}

variable "rg" {}

variable "nsg_name" {}

# list for names to call rules
variable "predefined_rules" {
  type    = any
  default = []
}

### NSG Rule pareameters ###
variable "rule_name" {}

variable "rule_priorty" {}

variable "rule_direction" {}

variable "rule_access" {}

variable "rule_protocol" {}

variable "rule_source_port" {}

variable "rule_destination_port" {}

variable "rule_source_ip" {}

variable "rule_destination_ip" {}