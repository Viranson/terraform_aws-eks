region     = "us-east-1"
access_key = ""
secret_key = ""

vpc_profile = {
  prod-vpc01 = {
    vpc_ipv4_cidr_block = "10.0.0.0/16"
    vpc_tags = {
      Name = "prod-vpc01"
    }
  }
}

vpc_subnets_profile = {
  public-us-east-1a = {
    vpc_name               = "prod-vpc01"
    az                     = "us-east-1a"
    subnet_ipv4_cidr_block = "10.0.1.0/24"
    vpc_subnet_tags = {
      Name = "public-us-east-1a-prod"
    }
  }

  public-us-east-1b = {
    vpc_name               = "prod-vpc01"
    az                     = "us-east-1b"
    subnet_ipv4_cidr_block = "10.0.3.0/24"
    vpc_subnet_tags = {
      Name = "public-us-east-1b-prod"
    }
  }

  private-us-east-1a = {
    vpc_name               = "prod-vpc01"
    az                     = "us-east-1a"
    subnet_ipv4_cidr_block = "10.0.0.0/24"
    vpc_subnet_tags = {
      Name = "private-us-east-1a-prod"
    }
  }

  private-us-east-1b = {
    vpc_name               = "prod-vpc01"
    az                     = "us-east-1b"
    subnet_ipv4_cidr_block = "10.0.2.0/24"
    vpc_subnet_tags = {
      Name = "private-us-east-1b-prod"
    }
  }
}

vpc_nat_eip_profile = {
  prod-vpc01-natgw_eip_01 = {
    vpc_name = "prod-vpc01"
    aws_nat_eip_tags = {
      Name = "prod-vpc01-natgw-eip"
    }
  }
  prod-vpc01-natgw_eip_02 = {
    vpc_name = "prod-vpc01"
    aws_nat_eip_tags = {
      Name = "prod-vpc01-natgw-eip"
    }
  }
}

vpc_igw_profile = {
  prod-vpc01-igw = {
    vpc_name = "prod-vpc01"
    aws_igw_tags = {
      Name = "prod-vpc01-igw"
    }
  }
}

vpc_natgw_profile = {
  prod-vpc01-natgw-01 = {
    vpc_name    = "prod-vpc01"
    subnet_name = "public-us-east-1a"
    eip_name    = "prod-vpc01-natgw_eip_01"
    aws_natgw_tags = {
      Name = "prod-vpc01-natgw"
    }
  }
  prod-vpc01-natgw-02 = {
    vpc_name    = "prod-vpc01"
    subnet_name = "public-us-east-1b"
    eip_name    = "prod-vpc01-natgw_eip_02"
    aws_natgw_tags = {
      Name = "prod-vpc01-natgw"
    }
  }
}

vpc_route_table_profile = {
  public-route-table = {
    scope                           = "public"
    vpc_name                        = "prod-vpc01"
    vpc_igw_name                    = "prod-vpc01-igw"
    vpc_route_table_ipv4_cidr_block = "0.0.0.0/0"
    vpc_route_table_tags = {
      Name = "public-route-table-prod"
    }
  }

  private-route-table-01 = {
    scope                           = "private"
    vpc_name                        = "prod-vpc01"
    vpc_natgw_name                  = "prod-vpc01-natgw-01"
    vpc_route_table_ipv4_cidr_block = "0.0.0.0/0"
    vpc_route_table_tags = {
      Name = "private-route-table-prod"
    }
  }

  private-route-table-02 = {
    scope                           = "private"
    vpc_name                        = "prod-vpc01"
    vpc_natgw_name                  = "prod-vpc01-natgw-02"
    vpc_route_table_ipv4_cidr_block = "0.0.0.0/0"
    vpc_route_table_tags = {
      Name = "private-route-table-prod"
    }
  }
}

vpc_route_table_assoc_profile = {
  public-route-table_assoc-01 = {
    subnet_name      = "public-us-east-1a"
    route_table_name = "public-route-table"
  }

  public-route-table_assoc-02 = {
    subnet_name      = "public-us-east-1b"
    route_table_name = "public-route-table"
  }

  private-route-table_assoc-01 = {
    subnet_name      = "private-us-east-1a"
    route_table_name = "private-route-table-01"
  }

  private-route-table_assoc-02 = {
    subnet_name      = "private-us-east-1b"
    route_table_name = "private-route-table-02"
  }
}

eks_cluster_profile = {
  prod-eks-cluster-01 = {
    subnets          = ["public-us-east-1a", "public-us-east-1b", "private-us-east-1a", "private-us-east-1b"] # subnets list
    eks_cluster_name = "prod_eks_cluster"
    aws_eks_tags = {
      Name = "prod-eks-cluster"
    }
  }
}

eks_node_group_profile = {
  prod-eks-node-01 = {
    subnets                       = ["private-us-east-1a", "private-us-east-1b"] # subnets list
    cluster_name                  = "prod-eks-cluster-01"
    node_group_name               = "prod_eks_node_01"
    node_iam_role                 = "prod-eks-node-01-role"
    eks_node_group_instance_types = ["t3.medium"]
    aws_eks_node_group_tags = {
      Name = "prod-eks-node-01"
    }
  }
  prod-eks-node-02 = {
    subnets                       = ["private-us-east-1a", "private-us-east-1b"] # subnets list
    cluster_name                  = "prod-eks-cluster-01"
    node_group_name               = "prod_eks_node_02"
    node_iam_role                 = "prod-eks-node-02-role"
    eks_node_group_instance_types = ["t3.medium"]
    aws_eks_node_group_tags = {
      Name = "prod-eks-node-02"
    }
  }
}