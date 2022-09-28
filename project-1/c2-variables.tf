# Input variables 
variable "aws_region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "EC2 instance type, example t2.micro"
  type        = string
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "Key Pair that need to be associated with an EC2 Instance"
  type        = string
  default     = "terraform-keyHO"
}