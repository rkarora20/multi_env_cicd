variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group for ALB"
  type        = string
}

variable "instance_id" {
  description = "Instance ID to attach to target group"
  type        = string
}

variable "target_port" {
  description = "Target port for traffic"
  type        = number
  default     = 80
}

variable "environment" {
  description = "Environment name"
  type        = string
}
