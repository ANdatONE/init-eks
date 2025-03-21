variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "eks-service"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Number of desired public subnets, recommended to have at least 3"
  type        = number
  default     = 3
}

variable "private_subnets" {
  description = "Number of desired private subnets, recommended to have at least 3"
  type        = number
  default     = 3

}

variable "subnets_bits" {
  description = "Number of bits to allocate for subnets"
  type        = number
  default     = 4

}

variable "vpc_azs" {
  description = "The availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]

}