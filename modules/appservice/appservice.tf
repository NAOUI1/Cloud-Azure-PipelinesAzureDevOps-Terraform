# create a S1 service plan
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan
resource "azurerm_app_service_plan" "asp" {
  name                = "asp1"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# create an app service
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service
resource "azurerm_app_service" "amethysteweb" {
  name                = "aspnetamethyste"
  location            = azurerm_app_service_plan.asp.location
  resource_group_name = azurerm_app_service_plan.asp.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  site_config {
    linux_fx_version = "DOCKER|amethystestor1.azurecr.io/amethystestor:latest"
  }
}

variable "resource_group_name" {
  type = string
    description = "value for resource_group_name."
  nullable = false
}

variable "location" {
  type        = string
    description = <<EOT
  value for location.

  Valid values are: westeurope, northeurope
  EOT
  default     = "westeurope"
  validation {
    condition     = contains(["westeurope", "northeurope"], var.location)
    error_message = "The location has an invalid value."
  }
}

output "app_service_name" {
  value = azurerm_app_service.amethysteweb.name
}

output "app_service_plan_name" {
  value = azurerm_app_service_plan.asp.name
}
