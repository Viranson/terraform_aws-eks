variable "eks_cluster_name" {
  type        = string
  description = "Amazon EKS cluster name"
}

variable "node_group_name" {
  type        = string
  description = "Amazon EKS Node Group name"
}

variable "vpc_subnet_ids" {
  type        = list(any)
  description = "List of Amazon Subnets IDs for EKS cluster"
}

variable "aws_eks_tags" {
  type        = map(any)
  description = "AWS EKS Resource Tags"
}