output "sps" {
  value     = azuread_application_password.sp.value
  sensitive = true
}
