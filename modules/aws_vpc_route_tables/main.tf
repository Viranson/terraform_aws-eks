resource "aws_route_table" "prod_vpc_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.vpc_route_table_ipv4_cidr_block
    gateway_id = var.vpc_route_table_gateway_id
  }

  #   route {
  #     ipv6_cidr_block        = "::/0"
  #     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  #   }

  tags = var.vpc_route_table_tags
}