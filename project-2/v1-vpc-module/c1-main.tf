# Terraform Block
terraform {
  # Any version equal or above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_version = "1.1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}