provider "aws" {

    region = "us-east-1"
    access_key = "AKIAWI7TGBPHJZGMVNSR"
    secret_key = "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"
}

module "EC2" {
    source = "./EC2"
    ami = "ami-09d56f8956ab235b3" 
    instance = "t2.micro"
    #vpc = "vpc-0fd938f1ed1cc78a8"
}

module "ASG" {
    source = "./ASG"
    placementgroupname = "pgnsharat" 
    placementgroupstrategy = "spread"
    asgname = "asgsharat"
    max = 5
    min = 2
    capacity = 4
    prefix = "foobar"
    imageid = "ami-09d56f8956ab235b3"
    instancetype = "t2.micro"
}

module "EKS" {
    source = "./EKS"
    eksclustername = "sharateksK"
    rolearn = "arn:aws:iam::431617346510:role/sharateksClusterRole"
    #subnet_ids = ["subnet-020f6930b6cfbd6ea", "subnet-065a4ad79383b4db1"]
}
    

module "ELASTIC_BEANSTALK" {
    source = "./ELASTIC_BEANSTALK"
    ebp = "test-sharat"
    ebsenv = "env-sharat"
    stackname = "64bit Amazon Linux 2 v3.3.13 running Python 3.8"

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