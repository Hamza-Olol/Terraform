# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private" {
  depends_on             = [module.vpc] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.17.0"
  name                   = "${var.environment}-instance"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.private_sg.this_security_group_id]
  subnet_ids = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]
  instance_count = var.private_instance_count
  user_data      = file("app1-install.sh")
  tags           = local.common_tags
}


