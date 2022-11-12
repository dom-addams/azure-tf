variable "name" {}

variable "string" {
  type = string
  default = "Dominic"
}

variable "number" {
  type = number
  default = 1
}

variable "boolean" {
  type = bool
  default = true
}

variable "list" {
  type = list
  default = ["dom", 2,"john"]
}

variable "map" {
  type = map
  default = {name = "Dom", age = 1}
}