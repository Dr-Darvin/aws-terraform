provider "aws" {
    region = "us-east-1" # which region to provision
    profile = "acme"     # using which account
}

variable "ssh-port" {  # name of the variable
    type = number      # type of the variable
    default = 22       # default value given
  
}

variable "vpc-name" {  # string variable
    type = string
    
}


variable "enabled" {   # boolean variable only true false
    type = bool
    default = true
  
}

variable "my-list" {    # list variable here its string
    type = list(string)
    default = [ "val1","val2" ]
}

variable "my-llist2" {   # list variable here its number
    type = list(number)
    default = [ 0,2,7,75 ]
  
}

variable "my-map" {     # map variable type its maping a value to a key
    type = map()
    default = {
        key1 = 2
        key2_word = "Hello"
        bol = true
    }
}

variable "mytuple" {       # tuple variable can define multipe data types
    type = tuple([ string, number, number ])
    default = [ "nina", 1, 33 ]
  
}

variable "myobject" {       # object variable 
    type = object({
      name = string
      port = list(number) 
      })
    default = {
      name = "Hello world"
      port = [ 22, 443, 80 ]
    }
  
}

#### Input ####

variable "inputport" {      # here giving and input when doing terraform plan
  type = number
  description = "Enter port nuber"
}


resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = var.vpc-name   # accessing variables var.variable_name
      port = var.inputport
    }
  
}


output "vpcid" {           # getting output after provisioving 
  value = aws_vpc.vpc.id   # value = aws_resource.resource-name-provideed_by_me.attribute
}



##### conditions ###

resource aws_instance {
    ami = "ami-123"
    instance_type = "t2.micro"
    count = var.environment == "prod" ? 1 : 0 # check weather environment variable equals to prod , if its prod reate a one instance if false don't crate
}

# then at run time we can specify as follows (this method is using assign values to variables that have already been declared in .tf files, not to declare new variables)
    # terraform init
    # terraform plan -var-file="prod.tfvars" 