# Security Group for Public Bastion Host
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"

  name        = "public-bastion-sg"
  description = "Security Group with SSH port open for my IP, egress ports are all world open"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = [var.sg_ingress_ip]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
}
