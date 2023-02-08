resource "aws_eks_cluster" "prod_eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.prod_eks_iam_role.arn

  vpc_config {
    subnet_ids = var.vpc_subnet_ids
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.prod-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.prod-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = var.aws_eks_tags
}

# AWS IAM ROLE AND POLICIES RESSOURCES
resource "aws_iam_role" "prod_eks_iam_role" {
  name = "aws_eks_iam_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.prod_eks_iam_role.name
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.prod_eks_iam_role.name
}