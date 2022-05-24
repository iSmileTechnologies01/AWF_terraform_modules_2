provider "aws" {
    region = "us-east-1"
    access_key = "AKIAWI7TGBPHPNZILAKC"
    secret_key = "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"
}

module "EC2" {
    source = "./EC2"
    ami = "ami-0022f774911c1d690" 
    instance = "t2.micro"
    #vpc = "vpc-0fd938f1ed1cc78a8"
}

module "ASG" {
    source = "./ASG"
    placementgroupname = "pgnsharat" 
    placementgroupstrategy = "cluster"
    asgname = "asgsharat"
    max = 5
    min = 2
    capacity = 4

}

module "EKS" {
    source = "./EKS"
    eksclustername = "sharateksK"
    rolearn = "arn:aws:iam::431617346510:role/sharateksClusterRole"

}
module "ELASTIC_BEANSTALK" {
    source = "./ELASTIC_BEANSTALK"
    ebp = "test-sharat"
    ebsenv = "env-sharat"
    stackname = "64bit Amazon Linux 2015.03 v2.0.3 running Go 1.4"

}
module "SNS" {
    source = "./SNS"
    snstopicname = "sharat-updates-topic"
    updatesqueue = "sharatU-queue"

}
module "SQS" {
    source = "./SQS"
    sqsqueue = "terraform-queue"
    delaysec = 90
    maxmsgsize = 2048
    msgretention =86400
    waittimesec =10
    maxreceivecount=4

}