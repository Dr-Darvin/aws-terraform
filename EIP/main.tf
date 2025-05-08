provider "aws" {
  profile = "default"
}

resource "aws_instance" "ec2server" {
  ami           = var.ami 
  instance_type = var.instance_type

  tags = {
        Name = var.servername
    }
}

resource "aws_eip" "EIP" {
  instance = aws_instance.ec2server.id
  domain   = "vpc"
}

output EIP_IP {
  value       = aws_eip.EIP.public_ip
}



