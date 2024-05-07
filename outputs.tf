### VPC
output "vpc_id" {
  value = one(module.vpc[*].vpc_id)
}

output "vpc_public_subnets" {
  value = one(module.vpc[*].vpc_public_subnets)
}

output "vpc_private_subnets" {
  value = one(module.vpc[*].vpc_private_subnets)
}

output "vpc_cidr" {
  value = one(module.vpc[*].vpc_cidr)
}

### ALB
output "lb_sg_id" {
  value = one(module.lb[*].security_group_id)
}

output "lb_dns_name" {
  value = one(module.lb[*].load_balancer_dns_name)
}

output "lb_zone_id" {
  value = one(module.lb[*].load_balancer_zone_id)
}

output "lb_https_listener_arns" {
  value = one(module.lb[*].load_balancer_https_listener_arns)
}
