variable "vpc_cidr_block" {
    type = string
    default = "172.35.0.0/16"
}


variable "route_cidr_block" {
    type = string
    default = "0.0.0.0/0"


}


variable "pvt1_cidr_block" {
    type = string
    default = "172.35.1.0/24"

}
variable "pvt1_availability_zone" {
    type = string
    default = "us-east-1a"

}


variable "pvt2_cidr_block" {
    type = string
    default = "172.35.2.0/24"

}

variable "pvt2_availability_zone" {
    type = string
    default = "us-east-1b"

}

