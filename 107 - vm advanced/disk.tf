resource "azurerm_managed_disk" "data_disk" {
  name                 = "terraform-vm-data-disk"
  location             = "UK South"
  resource_group_name  = "terraform-resources-rg"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachement" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.advanced_vm.id
  lun                = "10"
  caching            = "ReadWrite"
}