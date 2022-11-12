resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location
}

output "rg_id_output" {
  value = azurerm_resource_group.example.id
}