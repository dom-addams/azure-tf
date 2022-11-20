resource "azurerm_managed_disk" "data_disk" {
  name                 = var.data_disk_name
  location             = var.location
  resource_group_name  = var.rg
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachement" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.advanced_vm.id
  lun                = var.logical_numnber
  caching            = var.caching
}