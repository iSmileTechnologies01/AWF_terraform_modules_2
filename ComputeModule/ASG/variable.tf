variable "placementgroupname" {
    type = string
    default = "pgnsharat" 
}

variable "placementgroupstrategy" {
    type = string
    default = "cluster" 
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

