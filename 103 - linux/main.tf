resource "azurerm_network_interface" "linux_nic" {
  name                = "linux-vm-nic"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"

  ip_configuration {
    name                          = "linux-configuration"
    subnet_id                     = "/subscriptions/11794cc4-3bda-42e0-b5ef-86356d008ba3/resourceGroups/terraform-resources-rg/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/internal-resources"
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
    public_key = file("/Users/dominicaddams/Documents/Course Code/103 - linux/public.pub")
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