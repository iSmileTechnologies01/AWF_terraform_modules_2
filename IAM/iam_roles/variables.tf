variable "tags" {
  default     = {}
  description = " Resource tags"
  type        = map(string)
}

variable "rolename" {
  
  description = "Name of the role to be created"
  type        = string
}


