variable "sqsqueue" {
    type = string
    default = "terraform-queue"
}

variable "delaysec" {
    type = number
    default =90
}

variable "maxmsgsize" {
    type = number
    default =2048
}
variable "msgretention" {
    type = number
    default =86400
}
variable "waittimesec" {
    type = number
    default =10
}
variable "maxreceivecount" {
    type = number
    default = 4
}