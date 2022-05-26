


variable "cloudfront_function_name" {
  type    = string
  default = "TestFunction"

}




variable "runtime" {
  type    = string
  default = "cloudfront-js-1.0"

}


variable "comment" {
  type    = string
  default = "This is my CloudFront Function"

}

variable "codepath" {
  type    = string
  default = "./function.js"
}