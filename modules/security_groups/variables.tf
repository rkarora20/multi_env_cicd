variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "app_port" {
  description = "Port number for application traffic (e.g., 8080)"
  type        = number
  default     = 8080
}

variable "db_port" {
  description = "Port number for database (e.g., 3306 for MySQL)"
  type        = number
  default     = 3306
}
