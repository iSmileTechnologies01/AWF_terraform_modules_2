variable "hub-vpc-cidrblock" {
    type = string
    default = "172.16.0.0/16"
  
}

variable "route-table-cidrblock" {
    type = string
    default = "0.0.0.0/0"
  
}

variable "private-subnet-a" {
    type = string
    default = "172.16.1.0/24" 
  
}

variable "zone-a" {
    type = string
    default = "us-east-2a"
}

variable "private-subnet-b" {
    type = string
    default = "172.16.2.0/24"
  
}

variable "zone-b" {
    type = string
    default = "us-east-2b"
}

variable "private-subnet-c" {
    type = string
    default = "172.16.3.0/24"
  
}

variable "zone-c" {
    type = string
    default = "us-east-2c"
}

variable "public-subnet-a" {
    type = string
    default = "172.16.4.0/24"
}

variable "public-subnet-b" {
    type = string
    default = "172.16.5.0/24"
}

variable "public-subnet-c" {
    type = string
    default = "172.16.6.0/24"
}

variable "ingress" {
    type = list(string)
    default = ["0.0.0.0/0","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0"]
  
}

