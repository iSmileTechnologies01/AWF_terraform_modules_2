provider "aws" {
    
    region = "us-east-1"

  
}

resource "aws_iam_group" "group" {
  name = var.groupname
  
}