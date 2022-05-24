variable "eksclustername" {
    type = string
    default = "sharateksK"
}

variable "rolearn" {
    type = string
    #aws_iam_role.example.arn
    default = "arn:aws:iam::431617346510:role/sharateksClusterRole"
}

variable "subnetids" {
    type = list(string)
    default = ["subnet-020f6930b6cfbd6ea", "subnet-065a4ad79383b4db1"]
  
}