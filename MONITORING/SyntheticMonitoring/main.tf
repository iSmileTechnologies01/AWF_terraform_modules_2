

resource "aws_synthetics_canary" "some" {
  name                 = var.synmonitorname
  artifact_s3_location = var.s3location
  execution_role_arn   = var.canary
  handler              = var.handler
  zip_file             = var.file
  runtime_version      = var.Version

  schedule {
    expression = "rate(0 minute)"
  }
}