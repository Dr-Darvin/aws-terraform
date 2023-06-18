resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.ami_type
    security_groups = [aws_security_group.web_traffic.name]  # sec grp
  
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
    value =aws_eip.elasticip.public_ip
  
}

resource "aws_security_group" "web_traffic" {
    name = "Allow_HTTPS"

    ingress = {
        from_port = 443 # here by using from_port to to_port we can specify a range of ports like from_port = 5000 to_port = 5600
        to_port = 443 
        protocol = "TCP"
        cidr_block = ["0.0.0.0/0"]

    }

    egress = {
        from_port = 443 # here by using from_port to to_port we can specify a range of ports like from_port = 5000 to_port = 5600
        to_port = 443 
        protocol = "TCP"
        cidr_block = ["0.0.0.0/0"]

    }


  
}
