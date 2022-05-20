provider "aws" {
    
    region = "us-east-1"

  
}

resource "aws_iam_instance_profile" "test_profile" {
  name = var.instanceprofilename
  role = var.rolename
}
