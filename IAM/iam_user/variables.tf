variable "tags" {
  default     = {}
  description = " Resource tags"
  type        = map(string)
}

variable "username" {
  
  description = "Name of the user to be created"
  type        = string
}

