variable "vpc_id" {
  type        = string
  description = "Amazon VPC ID"
}

variable "vpc_route_table_ipv4_cidr_block" {
  type        = string
  description = "Amazon VPC Route IPV4_CIDR block"
  default     = "10.0.1.0/24"
}

variable "vpc_route_table_gateway_id" {
  type        = string
  description = "Amazon VPC Gateway ID"
}

variable "vpc_route_table_tags" {
  type        = map(any)
  description = "AWS Route Table Tags"
}