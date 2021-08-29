terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "remote" {
    organization = "landon"

    workspaces {
      prefix = "github-actions-iac-demo_"
    }
  }
}
