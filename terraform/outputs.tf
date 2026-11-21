output "app_id" {
  description = "Identifier of the deployed application service"
  value       = terraform_data.app_service.output.app_id
}

output "vault_id" {
  description = "Identifier of the application Key Vault"
  value       = terraform_data.key_vault.output.vault_id
}
