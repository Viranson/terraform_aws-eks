variable "eks_cluster_name" {
  type        = string
  description = "Name of the AWS EKS Cluster"
}

variable "node_group_name" {
  type        = string
  description = "Name of the EKS Node Group"
}

variable "node_iam_role" {
  type        = string
  description = "Name of the IAM Role for EKS Node Group"
}

variable "vpc_subnet_ids" {
  type        = list(any)
  description = "IDs of the VPC Subnets to associate with the EKS Node Group"
}

variable "eks_node_group_instance_types" {
  type        = list(any)
  description = "List of instance types associated with the EKS Node Group"
}

variable "aws_eks_node_group_tags" {
  type        = map(any)
  description = "AWS EKS Node Group Resource Tags"
}