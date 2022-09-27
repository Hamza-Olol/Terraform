# Terraform Output Values

# EC2 Public IP Output Value
output "ho-ec2-public-ip" {
  description = "EC2 instance Public IP"
  value       = aws_instance.web.public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.web.public_dns
}
