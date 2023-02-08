variable "vpc_ipv4_cidr_block" {
  type        = string
  description = "AWS VPC IPV4 CIDR Block"
  default     = "10.0.0.0/16"
}

variable "vpc_tags" {
  type        = map(any)
  description = "AWS VPC Resource Tags"
}