variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "eks-service"
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.32"
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the cluster endpoint is public"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "allowed_public_cidrs" {
  description = "List of CIDR blocks which can access the public endpoint of the EKS cluster"
  type        = list(string)
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the cluster endpoint is private"
  type        = bool
  default     = true

}

variable "log_configuration" {
  description = "List of log types to enable"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

}

variable "cloudwatch_log_group_retention_in_days" {
  description = "The number of days to retain log events in the log group"
  type        = number
  default     = 7
}

variable "cloudwatch_log_group_class" {
  description = "The class of the log group"
  type        = string
  default     = "STANDARD"
}

variable "addons" {
  description = "List of addon names to install"
  type        = map(any)
  default = {
    coredns                           = {}
    kube-proxy                        = {}
    vpc-cni                           = {}
    eks-pod-identity-agent            = {}
    aws-network-flow-monitoring-agent = {}
  }

}

variable "private_subnets" {
  description = "The private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "The public subnets"
  type        = list(string)
}

variable "intra_subnets" {
  description = "The subnets for the control plane"
  type        = list(string)
}

variable "public_instance_type" {
  description = "The instance type for the public node group"
  type        = list(string)
  default     = ["t3.small"]
}

variable "private_instance_type" {
  description = "The instance type for the private node group"
  type        = list(string)
  default     = ["t3.small"]
}