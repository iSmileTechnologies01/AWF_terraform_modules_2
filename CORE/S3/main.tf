resource "aws_s3_bucket" "buck" {
  bucket = var.bucketname


}

resource "aws_s3_bucket_acl" "b_acl" {
  bucket = aws_s3_bucket.buck.id
  acl    = var.acl
}

locals {
  s3_origin_id = var.s3_origin_id
}
