output "default_tags" {
  value = {
    Name           = var.project_name
    env            = var.env
    team           = var.team
    project-name   = var.project_name
    project-budget = var.project_budget
  }
}
