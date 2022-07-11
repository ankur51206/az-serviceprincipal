provider "azurerm" {
  features {}
}

data "azuread_client_config" "current" {}

resource "azuread_application" "sp" {
  display_name = "logicappsp"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp" {
  application_id               = azuread_application.sp.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "time_rotating" "sp" {
  rotation_days = 180
}

resource "azuread_application_password" "sp" {
  application_object_id = azuread_application.sp.object_id
  rotate_when_changed = {
    rotation = time_rotating.sp.id
  }
}
