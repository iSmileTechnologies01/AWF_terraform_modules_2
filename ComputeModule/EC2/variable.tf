# # AWS EC2 Instance Type
variable "ami"{
    type = string
    description = "ami for ec2 instance #example:ami-0022f774911c1d690#"
}

variable "instance"{
    type = string
    description = "select the instance type example t2 or t3 micro"
}

variable "vpc" {    
   type = string
   description = " which vpc id or use the default vpc id"
   default = "vpc-0fd938f1ed1cc78a8"
}

# variable "instance_type" {
#   description = "EC2 Instance Type"
#   type = string
#   default = "t2.micro"  
# }

# # AWS EC2 Instance Key Pair
# variable "instance_keypair" {
#   description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
#   type = string
#   default = "terraform-key"
# }

# # AWS EC2 Private Instance Count
# variable "private_instance_count" {
#   description = "AWS EC2 Private Instances Count"
#   type = number
#   default = 1  
# }