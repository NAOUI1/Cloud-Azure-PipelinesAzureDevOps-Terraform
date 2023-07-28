
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.38.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg2"
    storage_account_name = "remotestates"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  skip_provider_registration = true
  features {
  }
}

# create a resource group
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.LOCATION
}

module "storage" {
  source               = "./modules/storage"
  storage_account_rg   = azurerm_resource_group.rg.name
  storage_account_name = var.storage_account_name
  location             = var.LOCATION
  container_name       = var.container_name
}

module "appservice" {
  source              = "./modules/appservice"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.LOCATION
}


output "storage_account_tier" {
  value = module.storage.storage_account_tier
}

output "appservice" {
  value = {
    app_service_name      = module.appservice.app_service_name
    app_service_plan_name = module.appservice.app_service_plan_name
  }
}



