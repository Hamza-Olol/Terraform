# EC2 AWS Instance
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg-ssh.id, aws_security_group.sg-web.id]
  user_data              = file("app1-install.sh")
  key_name = var.instance_keypair


  tags = {
    Name = "ec2-tf-HO"
  }
}