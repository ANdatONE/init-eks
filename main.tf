module "main_eks_vpc" {
  # checkov:skip=CKV_TF_1: reference to a local module
  source       = "./vpc"
  project_name = var.project_name
}

data "external" "check_ip" {
  program = ["sh", "-c", "curl -s checkip.amazonaws.com | jq -R -c '{ip: .}'"]
}

locals {
  allowed_public_cidrs = var.allowed_public_cidrs != [] ? var.allowed_public_cidrs : ["${data.external.check_ip.result["ip"]}/32"]
}

module "main_eks_cluster" {
  # checkov:skip=CKV_TF_1: reference to a local module
  source                          = "./eks-cluster"
  vpc_id                          = module.main_eks_vpc.vpc_id
  cluster_version                 = var.eks_cluster_version
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  allowed_public_cidrs            = local.allowed_public_cidrs
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  private_subnets                 = module.main_eks_vpc.private_subnets
  public_subnets                  = module.main_eks_vpc.public_subnets
  intra_subnets                   = module.main_eks_vpc.intra_subnets

}
