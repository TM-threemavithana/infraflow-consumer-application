# Application Services Reference Module — Cloud-Free Simulation
# Models Application Compute, Microservice Ingress, and Key Vault using terraform_data.

terraform {
  required_version = ">= 1.6.0"
}

resource "terraform_data" "app_service" {
  input = {
    app_id      = "app-${var.app_name}-${var.environment}"
    min_tls     = "1.2"
    https_only  = true
    environment = var.environment
    tags        = var.tags
  }
}

resource "terraform_data" "key_vault" {
  input = {
    vault_id              = "kv-${var.app_name}-${var.environment}"
    purge_protection      = true
    soft_delete_retention = 90
    enable_rbac_auth      = true
    network_acls_default  = "Deny"
  }
}
