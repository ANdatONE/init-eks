
data "aws_availability_zones" "available" {}

locals {
  subnets_count   = var.public_subnets + var.private_subnets
  subnets_bits    = var.subnets_bits
  subnets_cidrs   = cidrsubnets(var.vpc_cidr_block, [for i in range(local.subnets_count) : local.subnets_bits]...)
  public_subnets  = [for idx, cidr in local.subnets_cidrs : cidr if idx < var.public_subnets]
  private_subnets = [for idx, cidr in local.subnets_cidrs : cidr if idx >= var.public_subnets]
  vpc_azs         = var.vpc_azs != [] ? var.vpc_azs : slice(data.aws_availability_zones.available.names, 0, 3)

}

module "vpc" {
  # checkov:skip=CKV_TF_1: module version is pinned
  source                  = "terraform-aws-modules/vpc/aws"
  version                 = "~> 5.17.0"
  name                    = "${var.project_name}-vpc"
  azs                     = local.vpc_azs
  private_subnets         = local.private_subnets
  public_subnets          = local.public_subnets
  map_public_ip_on_launch = true

  enable_nat_gateway   = true
  single_nat_gateway   = true
  create_igw           = true
  enable_dns_hostnames = true
  enable_dns_support   = true



}

