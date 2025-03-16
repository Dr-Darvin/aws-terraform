variable "cider_block" {
  description = "The CIDR block for the VPC"
    type = string
    default = "192.168.0.0/24"
}

variable "VPC_Name" {
  description = "The name of the VPC"
    type = string
    default = "Terraform_VPC"
}