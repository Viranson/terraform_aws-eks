resource "aws_internet_gateway" "prod_vpc_igw" {
  vpc_id = var.vpc_id

  tags = var.aws_igw_tags
}