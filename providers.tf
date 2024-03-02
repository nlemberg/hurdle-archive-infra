terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket                  = "nl-tf-backend"
    key                     = "hurdle-archive/terraform.state"
    region                  = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "naamal"
  }
}

provider "aws" {
  region                   = var.region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.profile

  default_tags {
    tags = {
      Owner           = var.profile
      bootcamp        = var.bootcamp
      expiration_date = var.expiration_date
    }
  }
}