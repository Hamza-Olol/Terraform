# Configure the provider

provider "aws" {
  region = "eu-west-2"
  access_key = "AKIARFW7JUDLYHJ95DIU"
  secret_key = "X/"
}

}
resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "testvpc"
  }

}
resource "aws_subnet" "subnet-1" {
  avpc_id = aws_vpc.testvpc.id
  cidr_block = "10.0.1.0/24
  tags = {
    name = "subnet-1"
  }
}

}
resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.testvpc.id
  cidr_block = "10.0.2.0/24
  tags = {
    name = "subnet-2"
  }
}