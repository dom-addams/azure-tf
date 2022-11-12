resource "azurerm_postgresql_server" "psql_example" {
  name                = "terraform-psqlserver-example"
  location            = "UK South"
  resource_group_name = "terraform-resources-rg"

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_4"
  version    = "9.6"
  storage_mb = 51200

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = true
  # for false, refer to Private Endpoint block on https://github.com/hashicorp/terraform-provider-azurerm/issues/8534
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_database" "psql_example_database" {
  name                = "dom-exampledb"
  resource_group_name = "terraform-resources-rg"
  server_name         = azurerm_postgresql_server.psql_example.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_virtual_network_rule" "db_vnet" {
  name                                 = "postgresql-vnet-rule"
  resource_group_name                  = "terraform-resources-rg"
  server_name                          = azurerm_postgresql_server.psql_example.name
  subnet_id                            = data.azurerm_subnet.data_subnet.id
  ignore_missing_vnet_service_endpoint = true
}
