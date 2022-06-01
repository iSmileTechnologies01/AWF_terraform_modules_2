variable "spoke2-vpc-cidrblock" {
    type = string
    default = ["172.32.0.0/16"]
  
}

variable "route-table-cidrblock" {
    type = string
    default = "0.0.0.0/0"
  
}

variable "pvt_main1" {
    type = string
    default = [ "172.32.1.0/24" ]
  
}

variable "zone-a" {
    type = string
    default = "us-east-2a"
}

variable "pvt_main2" {
    type = string
    default = ["172.32.2.0/24"]
  
}

variable "zone-b" {
    type = string
    default = "us-east-2b"
}

variable "pvt_main3" {
    type = string
    default = ["172.32.3.0/24"]
  
}

variable "zone-c" {
    type = string
    default = "us-east-2c"
}
