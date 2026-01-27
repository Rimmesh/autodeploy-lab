terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "plan" {
  name                = "asp-reference-api"
  location            = var.location
  resource_group_name = var.resource_group
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "reference-api-app-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_image     = var.image_name
      docker_image_tag = var.image_tag
    }
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    DOCKER_REGISTRY_SERVER_URL          = "https://${var.acr_login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME     = var.acr_username
    DOCKER_REGISTRY_SERVER_PASSWORD     = var.acr_password
  }
}

resource "random_string" "suffix" {
  length  = 5
  special = false
}
