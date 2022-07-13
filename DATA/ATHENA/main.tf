#This module helps in creating an interactive query service
#that makes it easy to analyze data in Amazon S3 using standard SQL.


#Create a provider
provider "aws" {
  region = var.region
}

#Create an athena database resource
resource "aws_athena_database" "example" {
  name   = var.name
  bucket = var.bucket_name
}

