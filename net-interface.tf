resource "aws_network_interface" "ec2server" {
  subnet_id   = var.subnet_id
  private_ips = [var.iplist[count.index]]
  security_groups = var.security_groups
  

  tags = {
    Name = var.serverlist[count.index]
    
  }
  count = var.number
}