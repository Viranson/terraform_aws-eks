output "prod_eks_cluster_endpoint" {
  value = aws_eks_cluster.prod_eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.prod_eks_cluster.certificate_authority[0].data
}

output "prod_eks_cluster_name" {
  value = aws_eks_cluster.prod_eks_cluster.name
}