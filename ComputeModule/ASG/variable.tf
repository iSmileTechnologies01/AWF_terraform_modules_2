variable "placementgroupname" {
    type = string
    default = "pgnsharat" 
}

variable "placementgroupstrategy" {
    type = string
    default = "spread" 
}

variable "asgname" {
    type = string
    default = "asgsharat"
}

variable "max" {
    type = number
    
}

variable "min" {
    type = number
}
variable "capacity" {
    type = number
}

variable "subnetids"{
    type = list(string)
    default = ["subnet-020f6930b6cfbd6ea"]
}

variable "imageid" {
    type = string
    default = "ami-09d56f8956ab235b3"
}

variable "instancetype" {
    type = string
    default = "t2.micro"
}

variable "prefix" {
    type = string
    default = "foobar"
}