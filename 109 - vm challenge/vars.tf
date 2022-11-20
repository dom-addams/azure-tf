##### General Parameters #####

variable "rg" {
  default = "terraform-resources-rg"
}

variable "location" {
  default = "UK South"
}

variable "allocation" {
  default = "Dynamic"
}

variable "direction_in" {
  default = "Inbound"
}

variable "direction_out" {
  default = "Outbound"
}

variable "traffic_allowed" {
    default = "Allow"
}

variable "traffic_denied" {
    default = "Denied"
}

variable "traffic_protocol" {
    default = "Tcp"
}

variable "allow_all" {
  default = "*"
}

##### VM Parameters #####

variable "vm_name" {
  default = "tf-advc-uks-vm"
}

variable "vm_size" {
    default = "Standard_B1s"
}

variable "vm_user" {
    default = "adminuser"
}

variable "vm_pass" {
  default = "P@$$w0rd1234!"
}

variable "image_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "image_offer" {
  default = "WindowsServer"
}

variable "image_sku" {
  default = "2019-Datacenter"
}

variable "image_version" {
  default = "latest"
}

##### Disk Parameters ####

variable "caching" {
  default = "ReadWrite"
}

variable "storage_account_type" {
  default = "Standard_LRS"
}

variable "data_disk_name" {
  default = "terraform-vm-data-disk"
}

variable "create_option" {
    default = "Empty"
}

variable "disk_size" {
    default = 10
}

variable "logical_numnber" {
    default = "10"
}

##### Vnet / Subnet Parameters #####

variable "vnet_name" {
  default = "advanced-vnet"
}

variable "vnet_range" {
  default = ["10.5.0.0/16"]
}

variable "public_subnet_name" {
  default = "public-resources"
}

variable "public_subnet_range" {
  default = ["10.5.0.0/24"]
}

##### NIC Parameters #####

variable "nic_name" {
  default = "advc-windows-vm-nic"
}

variable "ip_config_name" {
  default = "internal"
}

variable "private_ip_allocation" {
  default = "Dynamic"
}

##### PIP Parameters #####

variable "public_ip_name" {
  default = "public-ip"
}

##### NSG Parameters #####

variable "nsg_name" {
  default = "tf-advanced-nsg"
}

##### NSG Rules Parameters #####

variable "https_out_rule_name" {
  default = "https-outbound"
}

variable "https_rule_name" {
  default = "https-inbound"
}

variable "https_priority" {
  default = 110
}

variable "https_port" {
 default = 443
}

variable "http_rule_name" {
  default = "http-inbound"
}

variable "http_priority" {
  default = 120
}

variable "http_port" {
 default = 80
}

variable "rdp_rule_name" {
  default = "rdp-inbound"
}

variable "rdp_priority" {
  default = 130
}

variable "rdp_port" {
 default = 3389
}