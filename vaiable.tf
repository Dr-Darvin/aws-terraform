variable "profile" {
  type = string
  
  
}



variable "region" {
  type = string
  
  
}

variable "subnet_id" {
  type = string
   
}

variable "iplist" {
  type = list(string)
  
  
  
}

variable "security_groups" {
    type = list(string)
    
    
}

variable "serverlist" {
  type = list(string)
  description = "this is the name of the sever. give servers as a list"
  
}




variable "number" {
  type = number
  
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
  
  
}


variable "az" {
  type = string
}

variable "keyname" {
  type = string
  
}

variable "volume_size" {
  type = number
  
  
}


variable "volume_type" {
  type = string
  
}



