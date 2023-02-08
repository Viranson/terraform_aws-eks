variable "vpc_id" {
  type        = string
  description = "Parent VPC ID"
}

variable "aws_igw_tags" {
  type        = map(any)
  description = "AWS VPC Internet Gateway Resource Tags"
}