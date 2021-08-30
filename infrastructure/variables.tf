variable "environment" {
  type = string
}

locals {
  project     = "github-actions-iac-demo"
  environment = var.environment

  env = {
    defaults = {
      instance_count = 1
      project        = local.project
      environment    = var.environment
      region         = "us-west-2"
    }
  }

  default_tags = {
    project     = local.project
    environment = var.environment
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

  workspace = merge(local.env.defaults, lookup(
    local.workspaces,
    var.environment,
    local.workspaces.stage
  ))
}