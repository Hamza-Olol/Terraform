# Terraform module from the aws official registry
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  # VPC basic details
  name = "vpc-ho-dev"
  cidr = "10.0.0.0/16"
  azs  = ["eu-west-1a", "eu-west-1b"]
  # Private subnets + nat gatway per subnet
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_nat_gateway = true
  private_subnet_tags = {
    type = "ho-private-subnets"
  }
  # Public subnets
  public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  public_subnet_tags = {
    type = "ho-public-subnets"
  }
  # database subnets need to be turned to true (boolean)
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.5.0/24", "10.0.6.0/24"]
  database_subnet_tags = {
    type = "ho-DB-subnets"
  }
  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    owner       = "ho"
    environment = "dev"
  }

  vpc_tags = {
    name = "vpc-ho"
  }
}