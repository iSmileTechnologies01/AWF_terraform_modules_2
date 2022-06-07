variable "peer_owner_id" {
    type = string
    default = "431617346510"
}

variable "hub_vpc" {
    type = string
    default = "aws_vpc.hub_vpc.id"
}

variable "spoke1vpc" {
   type = string
   default = "aws_vpc.spoke1vpc.id"
}

variable "spoke2vpc" {
    type = string
    default = "aws_vpc.spoke2vpc.id"
  
}

variable "spoke3vpc" {
    type = string
    default = "aws_vpc.spoke3vpc.id"
  
}