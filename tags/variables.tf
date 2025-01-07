variable "project_name" {
  description = "The name of the project, is a group of services defined within a single project"
  type        = string
  default     = "my-awesome-project"
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

variable "project_budget" {
  description = "The monthly budget for the project"
  type        = number
  default     = 20
}
