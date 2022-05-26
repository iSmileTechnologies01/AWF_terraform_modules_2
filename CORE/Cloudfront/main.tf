resource "aws_cloudfront_function" "test" {
  name    = var.cloudfront_function_name
  runtime = var.runtime
  comment = var.comment
  publish = true
  code    = file(var.codepath)
}