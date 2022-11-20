output "name_example" {
  value = azurerm_resource_group.out_rg.name
}

output "id_example" {
  value = azurerm_resource_group.out_rg.id
}

resource "azurerm_resource_group" "out_rg" {
  name     = "outputs-rg"
  location = "UK South"
}