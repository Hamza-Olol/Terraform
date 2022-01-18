# Configure the provider

provider "aws" {
  region = "eu-west-2"
  access_key = "AKIARFW7JUDLYHJ95DIU"
  secret_key = "X/"
}


resource "aws_instance" "Test"{
  ami = "ami-02f5781cba46a5e8a"
  instance_type = "t2.micro"
}
