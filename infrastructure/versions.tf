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

  backend "s3" {
    bucket = "github-actions-iac-demo-tfstate"
    key    = "state"
    region = "us-west-1"
  }
}
