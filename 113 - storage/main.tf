resource "azurerm_resource_group" "storage_rg" {
  name     = "terraform-storage-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "all_storage" {
  name                     = "allmytfstorage123"
  resource_group_name      = azurerm_resource_group.storage_rg.name
  location                 = azurerm_resource_group.storage_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.all_storage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "tf-storage"
  storage_account_name   = azurerm_storage_account.all_storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = "103 - vm.zip"
}