resource "aws_subnet" "prod_vpc_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_ipv4_cidr_block
  availability_zone = var.az
  tags              = var.vpc_subnet_tags
}

