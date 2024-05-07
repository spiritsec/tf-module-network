
module "vpc" {
  count = try(var.all_configs.vpc.enabled, false) ? 1 : 0

  source                 = "./submodules/vpc"
  name_prefix            = try(var.all_configs.vpc.module_conf.name_prefix, "module-default-name")
  cidr                   = try(var.all_configs.vpc.module_conf.cidr, "")
  azs                    = data.aws_availability_zones.available.names
  private_subnets        = try(var.all_configs.vpc.module_conf.private_subnets, [""])
  public_subnets         = try(var.all_configs.vpc.module_conf.public_subnets, [""])
  enable_nat_gateway     = try(var.all_configs.vpc.module_conf.enable_nat_gateway, true)
  single_nat_gateway     = try(var.all_configs.vpc.module_conf.single_nat_gateway, true)
  one_nat_gateway_per_az = try(var.all_configs.vpc.module_conf.one_nat_gateway_per_az, false)
  enable_dns_hostnames   = try(var.all_configs.vpc.module_conf.enable_dns_hostnames, true)
}

module "lb" {
  count = try(var.all_configs.alb.enabled, false) ? 1 : 0

  source          = "./submodules/alb"
  name_prefix     = try(var.all_configs.alb.module_conf.name_prefix, "module-default-name")
  vpc_id          = one(module.vpc[*].vpc_id)
  public_subnets  = one(module.vpc[*].vpc_public_subnets)
  certificate_arn = try(var.all_configs.alb.module_conf.certificate_arn, "")

  depends_on = [module.vpc]
}
