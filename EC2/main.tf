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