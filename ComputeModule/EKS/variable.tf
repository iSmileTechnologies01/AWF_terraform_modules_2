variable "eksclustername" {
    type = string
    default = "sharateksK"
}

variable "rolearn" {
    type = string
    #aws_iam_role.example.arn
    default = "arn:aws:iam::431617346510:role/sharateksClusterRole"
}