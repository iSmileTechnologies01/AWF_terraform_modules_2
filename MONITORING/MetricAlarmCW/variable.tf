variable "alarmname" {
    type = string
    default = "ec2-Alarms"  
}

variable "operator" {
    type = string
    default = "GreaterThanThreshold"
  
}
variable "evaluationperiod" {
    type = number
    default = 3
}
variable "datapointsalarm" {
    type = number
    default = 2
}
variable "metricname" {
    type = string
    default = "CPUUtilization"
}
variable "namespace" {
    type = string
    default = "AWS/EC2"
}
variable "period" {
    type = number
    default = 120
}


variable "threshold" {
    type = number
    default = 80
}
variable "ASGname" {
    type = string
    default = "aws_autoscaling_group.bar.name"
}