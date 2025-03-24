variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "eks-service"
}

variable "project_budget" {
  description = "The monthly budget for the project"
  type        = number
  default     = 20
}

variable "env" {
  description = "The environment for the project"
  type        = string
  default     = "dev"

}

variable "team" {
  description = "The team responsible for the project"
  type        = string
  default     = "platform"
}

variable "eks_cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.32"
}

variable "allowed_public_cidrs" {
  description = "value of the allowed public CIDR"
  type        = list(string)
  default     = []
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the cluster endpoint is public"
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the cluster endpoint is private"
  type        = bool
  default     = true
}