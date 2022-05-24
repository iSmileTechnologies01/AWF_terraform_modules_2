

resource "aws_eks_cluster" "example" {
  name     = var.eksclustername
  role_arn = var.rolearn

  vpc_config {
    subnet_ids = ["subnet-020f6930b6cfbd6ea", "subnet-065a4ad79383b4db1"]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
 # depends_on = [
  ##  aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  #]
}

