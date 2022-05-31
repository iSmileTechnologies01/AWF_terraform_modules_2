variable "filename" {
  default = "lambda_function_payload.zip"
  type    = string

}

variable "runtime" {
  default = "nodejs12.x"
  type    = string

}
variable "function_name" {
  default = "lambda_function_name"
  type    = string
}


variable "rolename" {
  default = "IamRole"
  type    = string
}

