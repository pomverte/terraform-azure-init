resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.azure_location

  tags = var.tags
}

resource "random_id" "id" {
  byte_length = 4
}

resource "azurerm_storage_account" "tf_remote_backend" {
  name                      = format("%s%s", var.storage_account_name, random_id.id.hex)
  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  account_tier              = "Standard"
  access_tier               = "Hot"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "terraform" {
  name                  = var.storage_account_container_name
  storage_account_name  = azurerm_storage_account.tf_remote_backend.name
  container_access_type = "private"

  lifecycle {
    prevent_destroy = true
  }
}
