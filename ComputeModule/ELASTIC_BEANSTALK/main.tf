

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = var.ebp
  description = var.descrip
}

resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = var.ebsenv
  application         = aws_elastic_beanstalk_application.tftest.name
  solution_stack_name = var.stackname
}