output "cloudtrail_id" {
   description = "The Cloudtrail logs"
   value = aws_cloudtrail.Cloudtrailstring.id
}

output "bucket_id" {
   description = "The Bucket to store all the logs in the account"
   value = aws_s3_bucket.bucket-string.id
}

output "bucketpolicy_id" {
   description = "The policy for the bucket for storing logs"
   value = aws_s3_bucket_policy.your-policy.id
}