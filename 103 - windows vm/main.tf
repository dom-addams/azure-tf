resource "azurerm_network_interface" "windows_nic" {
  name                = "windows-vm-nic"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"

  ip_configuration {
    name                          = "windows-configuration"
    subnet_id                     = "/subscriptions/11794cc4-3bda-42e0-b5ef-86356d008ba3/resourceGroups/terraform-resources-rg/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/internal-resources"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "win_vm" {
  name                = "windows-vm"
  resource_group_name = "terraform-resources-rg"
  location            = "UK South"
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.windows_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}