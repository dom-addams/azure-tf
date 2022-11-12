variable "my_subnets" {
  type = list(object({
    sub_name = string
    address  = string
  }))
}