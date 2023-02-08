resource "aws_eks_node_group" "example" {
  cluster_name    = var.eks_cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.prod_eks_node_group_iam_role.arn
  subnet_ids      = var.vpc_subnet_ids
  instance_type   = var.eks_node_group_instance_types
  tags            = var.aws_eks_node_group_tags

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.prod-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.prod-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.prod-AmazonEC2ContainerRegistryReadOnly,
  ]
}

## IAM Role for EKS Node Group
resource "aws_iam_role" "prod_eks_node_group_iam_role" {
  name = var.node_iam_role

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.prod_eks_node_group_iam_role.name
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.prod_eks_node_group_iam_role.name
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.prod_eks_node_group_iam_role.name
}