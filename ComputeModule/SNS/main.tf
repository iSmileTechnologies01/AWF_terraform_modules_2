

resource "aws_sns_topic" "user_updates" {
  name = var.snstopicname
}

resource "aws_sqs_queue" "user_updates_queue" {
  name = var.updatesqueue
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.user_updates_queue.arn
}

