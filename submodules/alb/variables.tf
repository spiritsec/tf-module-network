variable "name_prefix" {
  type    = string
  default = "module-default-name"
}

# VPC variables
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

# ALB variables
variable "certificate_arn" {
  description = "The ARN of the SSL certificate"
  type        = string
}

# SG variables
