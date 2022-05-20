provider "aws" {
    
    region = "us-east-1"

  
}



resource "aws_iam_group_membership" "team" {
  name = var.membershipname

  users =  var.users

  group = var.group
}