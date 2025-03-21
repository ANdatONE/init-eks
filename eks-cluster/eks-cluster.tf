module "eks_cluster" {
  # checkov:skip=CKV_TF_1: module version is pinned
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.33.1"

  cluster_name                             = "${var.project_name}-eks-cluster"
  cluster_version                          = var.cluster_version
  cluster_endpoint_public_access           = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs     = var.allowed_public_cidrs
  cluster_endpoint_private_access          = var.cluster_endpoint_private_access
  cluster_enabled_log_types                = var.log_configuration
  enable_cluster_creator_admin_permissions = true
  vpc_id                                   = var.vpc_id
  subnet_ids                               = var.private_subnets
  control_plane_subnet_ids                 = var.intra_subnets
  cluster_addons                           = var.addons
  cloudwatch_log_group_retention_in_days   = var.cloudwatch_log_group_retention_in_days
  cloudwatch_log_group_class               = var.cloudwatch_log_group_class

  eks_managed_node_groups = {
    karpenter_private = {
      ami_type       = "BOTTLEROCKET_x86_64"
      instance_types = var.private_instance_type
      subnet_ids     = var.private_subnets

      min_size     = 1
      max_size     = 3
      desired_size = 1

      labels = {
        # Used to ensure Karpenter runs on nodes that it does not manage
        "karpenter.sh/controller" = "true"
      }
    },
    karpenter_public = {
      ami_type       = "BOTTLEROCKET_x86_64"
      instance_types = var.public_instance_type
      subnet_ids     = var.public_subnets

      min_size     = 1
      max_size     = 3
      desired_size = 1

      labels = {
        # Used to ensure Karpenter runs on nodes that it does not manage
        "karpenter.sh/controller" = "true"
      }
    }

  }



}