resource "aws_subnet" "prod_vpc_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_ipv4_cidr_block
  availability_zone = var.az
  tags              = var.vpc_subnet_tags
}
