provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "pt_vpc" {
  cidr_block = "172.16.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "pt_vpc"
  }
}

#Create security group with firewall rules
resource "aws_security_group" "security_pt_instance_grp" {
  name        = var.pt_security_group
  description = "security group for pt_instance"
vpc_id      = aws_vpc.pt_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound rule
  egress {
    from_port   = 0
       to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = var.pt_security_group
  }
}

resource "aws_instance" "pt_instance" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  tags= {
    Name = var.tag_name
  }
}
