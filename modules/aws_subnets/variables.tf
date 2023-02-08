variable "vpc_id" {
  type        = string
  description = "Parent VPC ID"
}

variable "az" {
  type        = string
  description = "Availability zone"
}

variable "subnet_ipv4_cidr_block" {
  type        = string
  description = "AWS VPC SUBNET CIDR Block"
  default     = "10.0.1.0/24"
}

variable "vpc_subnet_tags" {
  type        = map(any)
  description = "AWS VPC Subnet Resource Tags"
}