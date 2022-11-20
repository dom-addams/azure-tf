resource "azurerm_mssql_server" "sql_example" {
  name                         = "dom-example-sql-server"
  resource_group_name          = "terraform-resources-rg"
  location                     = "UK South"
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "database_example" {
  name           = "sql-acctest-db-d"
  server_id      = azurerm_mssql_server.sql_example.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true
}
