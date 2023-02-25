provider "aws" {
  region = var.default_region
  default_tags {
    tags = {
      "ManagedBy" = "Terraform"
    }

  }
}

terraform {
  backend "local" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.45"
    }
  }
}