variable "azure_location" {
  description = "Azure location"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "rg-terraform-init"

  validation {
    # https://docs.microsoft.com/en-gb/azure/azure-resource-manager/management/resource-name-rules#microsoftresources
    condition     = can(regex("^[-\\w\\._\\(\\)]+$", var.resource_group_name))
    error_message = "The resource_group_name must be alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters."
  }
}

variable "storage_account_name" {
  description = "Azure storage account name that will host the remote backend"
  type        = string
  default     = "terraform"

  validation {
    # https://docs.microsoft.com/en-gb/azure/azure-resource-manager/management/resource-name-rules#microsoftstorage
    condition     = can(regex("^[a-z0-9]{3,20}$", var.storage_account_name))
    error_message = "The storage_account_name must be 3-24 lowercase letters and numbers. Four characters are reserved for a random id to avoir any collision."
  }
}

variable "storage_account_container_name" {
  description = "Azure storage account container name"
  type        = string
  default     = "terraform"

  validation {
    # https://docs.microsoft.com/en-gb/azure/azure-resource-manager/management/resource-name-rules#microsoftstorage
    # condition = can(regex("^(?!-)(?!.*--)[a-z0-9-]{3,63}(?<!-)$", var.storage_account_container_name))
    condition     = can(regex("^[a-z0-9-]{3,63}$", var.storage_account_container_name))
    error_message = "The storage_account_container_name must contains 3-63 lowercase letters, numbers, and hyphens. Start with lowercase letter or number. Can't use consecutive hyphens."
  }
}

variable "tags" {
  description = "Azure resources tags"
  type        = map(string)
  default = {
    Provider = "Terraform"
    Purpose  = "Terraform remote backend"
  }
}
