variable "app_name" {
  type        = string
  description = "Application microservice identifier"
  default     = "order-api"

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]{2,30}[a-z0-9]$", var.app_name))
    error_message = "app_name must be a valid lowercase alphanumeric identifier."
  }
}

variable "environment" {
  type        = string
  description = "Target deployment environment"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging, or prod."
  }
}

variable "tags" {
  type        = map(string)
  description = "Resource governance tags"
  default = {
    Environment = "dev"
    ManagedBy   = "infraflow"
    Workload    = "application"
  }
}
