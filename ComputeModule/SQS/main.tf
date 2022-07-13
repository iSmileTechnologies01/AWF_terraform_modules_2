

resource "aws_sqs_queue" "terraform_queue" {
  name                      = var.sqsqueue
  delay_seconds             = var.delaysec
  max_message_size          = var.maxmsgsize
  message_retention_seconds = var.msgretention
  receive_wait_time_seconds = var.waittimesec
  # redrive_policy = jsonencode({
  #  # deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
  #   maxReceiveCount     = var.maxreceivecount
  # })
  # redrive_allow_policy = jsonencode({
  #   redrivePermission = "byQueue",
  #   sourceQueueArns   = [aws_sqs_queue.terraform_queue_deadletter.arn]
  # })
 
}

