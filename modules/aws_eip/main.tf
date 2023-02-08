resource "aws_eip" "prod_nat_eip" {
  tags = var.aws_nat_eip_tags
}