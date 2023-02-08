resource "aws_nat_gateway" "prod_vpc_natgw" {
  allocation_id = var.aws_eip_id
  subnet_id     = var.aws_vpc_subnet_id

  tags = var.vpc_natgw_tags

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # depends_on = [aws_internet_gateway.example]
}