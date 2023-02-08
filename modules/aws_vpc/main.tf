resource "aws_vpc" "prod_vpc" {
  cidr_block = var.vpc_ipv4_cidr_block
  tags       = var.vpc_tags
}