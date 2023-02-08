variable "aws_subnet_id" {
  type        = string
  description = "ID of the AWS VPC Subnet to associate with the route table"
}

variable "aws_route_table_id" {
  type        = string
  description = "ID of the AWS VPC Route Talble to associate"
}