locals {
  project     = "github-actions-iac-demo"
  environment = terraform.workspace

  env = {
    defaults = {
      instance_count = 1
      project        = local.project
      environment    = terraform.workspace
      region         = "us-west-2"
    }
  }

  default_tags = {
    project     = local.project
    environment = terraform.workspace
    terraform   = true
  }

  workspaces = {
    stage = {
      instance_count = 2
    }
    production = {
      instance_count = 3
    }
  }

  workspace = merge(local.env["defaults"], lookup(
    local.workspaces,
    terraform.workspace,
    local.workspaces.stage
  ))
}