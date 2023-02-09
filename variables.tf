#Variables values defined in terraform.tfvars file
##---------CRDS----------
variable "region" {
  type        = string
  description = "AWS Region to provision resources"
}

variable "access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type        = string
  description = "AWS Secret Key"
}
##---------CRDS----------


##---------RESOURCES_VARS----------
variable "vpc_profile" {
  # type        = map(any)
  description = "AWS VPC resource variables set in map"
}

variable "vpc_subnets_profile" {
  # type        = map(any)
  description = "AWS VPC Subnets resources variables set in map"
}

variable "vpc_nat_eip_profile" {
  # type        = map(any)
  description = "AWS EIP variables set in map"
}

variable "vpc_igw_profile" {
  # type        = map(any)
  description = "AWS VPC Intenet Gateway variables set in map"
}

variable "vpc_natgw_profile" {
  # type        = map(any)
  description = "AWS VPC NAT Gateway variables set in map"
}

variable "vpc_route_table_profile" {
  # type        = map(any)
  description = "AWS VPC Route Tables resources variables set in map"
}

variable "vpc_route_table_assoc_profile" {
  # type        = map(any)
  description = "AWS VPC Route Tables Association resources variables set in map"
}

variable "eks_cluster_profile" {
  # type        = map(any)
  description = "AWS EKS resources variables set in map"
}

variable "eks_node_group_profile" {
  # type        = map(any)
  description = "AWS VPC Route Tables Association resources variables set in map"
}
##---------RESOURCES_VARS----------