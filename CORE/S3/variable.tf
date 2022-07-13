variable "bucketname" {
  default = "my-tf-test-bucket"
  type    = string

}


variable "acl" {
  default = "private"
  type    = string
}


variable "s3_origin_id" {
  default = "myS3Origin"
  type    = string

}