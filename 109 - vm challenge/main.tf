resource "azurerm_windows_virtual_machine" "advanced_vm" {
  name                = var.vm_name
  resource_group_name = var.rg
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vm_user
  admin_password      = var.vm_pass
  network_interface_ids = [
    azurerm_network_interface.advanced_nic.id
  ]

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}