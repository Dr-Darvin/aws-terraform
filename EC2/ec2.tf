
#Create 2 EC2 instances 

resource "aws_instance" "ec2server" {
  ami           = var.ami 
  instance_type = var.instance_type
  availability_zone = var.az
  key_name  = var.keyname

  network_interface {
    network_interface_id = aws_network_interface.ec2server[count.index].id
    device_index = 0
  }
  

 

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    

      tags = {
        Name = var.serverlist[count.index]
        
        
      }

  }

  depends_on = [aws_network_interface.ec2server]
 
  tags = {
        Name = var.serverlist[count.index]
        
        
      }
  
count = var.number

}
