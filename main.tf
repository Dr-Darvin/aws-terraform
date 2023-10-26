#Specify the Provider and the region 

provider "aws" {
  
  region = var.region
# profile = "profile name"   you can give already provisned profile this is the safest method
  access_key = "my-access-key" # this s givving access keys *** NOT RECOMEMNDED ***
  secret_key = "my-secret-key"
  
}



