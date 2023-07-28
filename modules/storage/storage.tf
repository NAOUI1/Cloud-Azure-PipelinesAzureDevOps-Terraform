# create storage account  
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.storage_account_rg
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


# create a container
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container
resource "azurerm_storage_container" "sc" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

variable "storage_account_rg" {
  type        = string
  nullable    = false
  description = "The name of the resource group in which to create the storage account."
}

variable "location" {
  type    = string
  default = "westeurope"
  validation {
    condition     = contains(["westeurope", "northeurope"], var.location)
    error_message = "The location has an invalid value."
  }
  description = <<EOT
  value for location.

  Valid values are: westeurope, northeurope
  EOT
}

variable "storage_account_name" {
  type        = string
  nullable    = false
  description = "The name of the storage account."
}

variable "container_name" {
  type        = string
  nullable    = false
  description = "The name of the container."
}


output "storage_account_tier" {
  value = azurerm_storage_account.sa.account_tier
}
