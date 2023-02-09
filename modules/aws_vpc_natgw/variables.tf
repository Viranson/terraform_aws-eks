variable "aws_vpc_subnet_id" {
  type        = string
  description = "ID of AWS VPC Subnet Subnet ID of the subnet in which to place the gateway"
}

variable "vpc_natgw_tags" {
  type        = map(any)
  description = "AWS VPC NAT Gateway Resource TAGS"
}

variable "aws_eip_id" {
  type        = string
  description = "ID of the Elastic IP address for the gateway"
}