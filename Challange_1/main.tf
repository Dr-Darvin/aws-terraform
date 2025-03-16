provider "aws" {
  region = "us-east-2"
  profile = "default"
}
resource aws_vpc "Terraform_VPC" {
  cidr_block = var.cider_block

  tags = {
    Name = var.VPC_Name
  }
}