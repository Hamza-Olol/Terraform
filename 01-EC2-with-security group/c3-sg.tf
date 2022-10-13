# ssh security group
resource "aws_security_group" "sg-ssh" {
  name        = "sgssh"
  description = "Allow SSH into an instance"

  ingress {
    description = "SSH from port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Fill in below with your own ip to be more secure and not allow access to everyone
    cidr_blocks = [var.sg_ingress_ip] # Personal IP in hidden variable file.
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-ssh-tf-HO"
  }
}

# Web security group 

resource "aws_security_group" "sg-web" {
  name        = "sgweb"
  description = "Allow web access"
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Fill in below with your own ip to be more secure and not allow access to everyone
    cidr_blocks = [var.sg_ingress_ip]
  }
  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Fill in below with your own ip to be more secure and not allow access to everyone
    cidr_blocks = [var.sg_ingress_ip]
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-web-tf-HO"
  }
}