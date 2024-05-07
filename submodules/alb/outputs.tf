output "security_group_id" {
  value = aws_security_group.security_group.id
}

output "load_balancer_dns_name" {
  value = module.alb.lb_dns_name
}

output "load_balancer_zone_id" {
  value = module.alb.lb_zone_id
}

output "load_balancer_https_listener_arns" {
  value = module.alb.https_listener_arns[0]
}
