terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = module.tags.default_tags
  }
}

module "tags" {
  source         = "./tags"
  project_name   = var.project_name
  env            = var.env
  team           = var.team
  project_budget = var.project_budget
}