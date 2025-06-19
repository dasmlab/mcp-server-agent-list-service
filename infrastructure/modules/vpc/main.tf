module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = var.name
  cidr = var.cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = [cidrsubnet(var.cidr, 4, 1), cidrsubnet(var.cidr, 4, 2), cidrsubnet(var.cidr, 4, 3)]
  public_subnets  = [cidrsubnet(var.cidr, 4, 101), cidrsubnet(var.cidr, 4, 102), cidrsubnet(var.cidr, 4, 103)]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
}

data "aws_availability_zones" "available" {}

output "vpc_id" {
  value = module.vpc.vpc_id
}
output "private_subnets" {
  value = module.vpc.private_subnets
}

