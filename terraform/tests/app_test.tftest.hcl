# Application Services Native Test Suite

run "verify_app_defaults" {
  command = plan

  assert {
    condition     = var.app_name == "order-api"
    error_message = "Default app_name must be 'order-api'."
  }

  assert {
    condition     = var.environment == "dev"
    error_message = "Default environment must be 'dev'."
  }
}

run "verify_custom_app_service" {
  command = plan

  variables {
    app_name    = "payment-gateway"
    environment = "prod"
    tags = {
      Environment = "prod"
      ManagedBy   = "infraflow"
      Workload    = "application"
    }
  }

  assert {
    condition     = var.app_name == "payment-gateway"
    error_message = "App name mismatch in custom configuration."
  }

  assert {
    condition     = var.environment == "prod"
    error_message = "Environment mismatch in production configuration."
  }
}
