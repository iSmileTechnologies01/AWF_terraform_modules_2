variable "region" {
    type = string
    description = "Enter the region"
}

variable "attach_to_instance" {
    type = bool
    default = false
}

variable "availability_zone" {
    type = string
    description = "Enter your preferred availability zone"
}

variable "tag_name_ebs" {
    type = string
    description = "Enter your EBS tag name"
    default = "terraform_created_ebs"
}

variable "tag_name_snapshot" {
    type = string
    description = "Enter your snapshot tag name"
    default = "terraform_created_snap"
}


variable "device_name" {
    type = string
    description = "Enter the Device Name"
}

variable "instance_id" {
  type = string
  description = "Enter a instance to attach to ebs"
}