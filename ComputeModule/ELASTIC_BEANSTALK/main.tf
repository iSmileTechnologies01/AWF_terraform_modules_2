

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = var.ebp
  description = var.descrip
  
  appversion_lifecycle {
    service_role          = "arn:aws:iam::431617346510:role/aws-service-role/elasticbeanstalk.amazonaws.com/AWSServiceRoleForElasticBeanstalk"
  #  max_count             = 128
  #  delete_source_from_s3 = true
  }
}

#resource "aws_elastic_beanstalk_environment" "tfenvtest" {
 # name                = var.ebsenv
 # application         = aws_elastic_beanstalk_application.tftest.name
 # solution_stack_name = var.stackname
#}

#setting {
 #     namespace = "aws:autoscaling:launchconfiguration"
  #    name = "IamInstanceProfile"
   #   value = "aws-elasticbeanstalk-ec2-role"
  #}