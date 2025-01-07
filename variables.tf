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
  default     = "my-awesome-team"

}
