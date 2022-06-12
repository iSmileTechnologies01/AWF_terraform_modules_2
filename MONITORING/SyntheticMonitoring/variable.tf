variable "synmonitorname" {
    type = string
    default = "some-canary"
}

variable "s3location" {
    type = string
    default = "s3://sspipelines/"
  
}

variable "canary" {
    type = string
    default = "arn:aws:iam::431617346510:role/CWcanaryc"
  
}

variable "handler" {
    type = string
    default = "exports.handler"

}

variable "file" {
    type = string
    default = "./index.zip"
  
}

variable "Version" {
    type = string
    default = "syn-python-selenium-1.2"
  
}