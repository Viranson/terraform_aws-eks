resource "aws_route_table_association" "prod_vpc_route_table_assoc" {
  subnet_id      = var.aws_subnet_id
  route_table_id = var.aws_route_table_id
}