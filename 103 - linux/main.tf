resource "azurerm_network_interface" "linux_nic" {
  name                = "linux-vm-nic"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"

  ip_configuration {
    name                          = "linux-configuration"
    subnet_id                     = ""
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "linux-vm"
  resource_group_name = "terraform-resources-rg"
  location            = "UK South"
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.linux_nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}