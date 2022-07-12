output "service_principal_name" {
  value = azuread_service_principal.sp.display_name
}

output "azuread_application_password_Secret" {
  value     = azuread_application_password.sp.value
  sensitive = true
}

output "application_id" {
  value = azuread_application.sp.application_id
}

output "application_object_id" {
  value = azuread_application.sp.object_id
}
