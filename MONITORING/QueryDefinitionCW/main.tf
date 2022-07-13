
resource "aws_cloudwatch_query_definition" "qdef" {
  name = var.namedef
  
  log_group_names = [
    "/aws/logGroup1",
    "/aws/logGroup2"
  ]

  query_string = <<EOF
fields @timestamp, @message
| sort @timestamp desc
| limit 25
EOF
}