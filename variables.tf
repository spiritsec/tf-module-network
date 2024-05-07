variable "all_configs" {
  description = "Configuration for submodules"
  type        = any
  default = {
    "vpc" = {
      "enabled" = true
      "module_conf" = {
        "name_prefix" = "default-name"
        "cidr"        = "0.0.0.0/16"
        "private_subnets" = [
          "0.0.0.0/24",
          "0.0.0.0/24"
        ]
        "public_subnets" = [
          "0.0.0.0/24",
          "0.0.0.0/24"
        ]
        "enable_nat_gateway"     = true
        "single_nat_gateway"     = true
        "one_nat_gateway_per_az" = true
        "enable_dns_hostnames"   = true
      }
    }
    "alb" = {
      "enabled" = true
      "module_conf" = {
        "name_prefix"     = "default-name"
        "certificate_arn" = "certificate-arn"
      }
    }
  }
}
