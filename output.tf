output "resource_group_name" {
  value = azurerm_storage_account.tf_remote_backend.resource_group_name
}
output "location" {
  value = azurerm_storage_account.tf_remote_backend.location
}
output "storage_account_name" {
  value = azurerm_storage_account.tf_remote_backend.name
}
output "storage_account_container_name" {
  value = azurerm_storage_container.terraform.name
}
output "primary_access_key" {
  value = azurerm_storage_account.tf_remote_backend.primary_access_key
}
