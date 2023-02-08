module "aws_vpc" {
  source         = "./modules/aws_vpc"
  for_each       = var.vpc_profile
  vpc_cidr_block = each.value.vpc_ipv4_cidr_block
  tags           = each.value.vpc_tags
}

module "aws_subnet" {
  source            = "./modules/aws_subnets"
  for_each          = var.vpc_subnets_profile
  vpc_id            = module.aws_vpc[each.value.vpc_name].vpc_id
  subnet_cidr_block = each.value.subnet_ipv4_cidr_block
  az                = each.value.az
  tags              = each.value.vpc_subnet_tags
}

module "aws_igw" {
  source   = "./modules/aws_vpc_igw"
  for_each = var.vpc_igw_profile
  vpc_id   = module.aws_vpc[each.value.vpc_name].vpc_id
  tags     = each.value.aws_igw_tags
}

module "aws_nat_eip" {
  source   = "./modules/aws_eip"
  for_each = var.vpc_nat_eip_profile
  tags     = each.value.aws_natgw_tags
}

module "aws_natgw" {
  source            = "./modules/aws_vpc_natgw"
  for_each          = var.vpc_natgw_profile
  aws_vpc_subnet_id = module.aws_subnet[each.value.subnet_name].aws_subnet_id
  aws_eip_id        = module.aws_nat_eip[each.value.eip_name].aws_nat_eip_id
  tags              = each.value.aws_natgw_tags
}

module "aws_route_table" {
  source                          = "./modules/aws_vpc_route_tables"
  for_each                        = var.vpc_route_table_profile
  vpc_id                          = module.aws_vpc[each.value.vpc_name].vpc_id
  vpc_route_table_gateway_id      = each.value.scope == "public" ? module.aws_igw[each.value.vpc_igw_name].vpc_igw_id : module.aws_natgw[each.value.vpc_natgw_name].vpc_natgw_id
  vpc_route_table_ipv4_cidr_block = each.value.vpc_route_table_ipv4_cidr_block
  vpc_route_table_tags            = each.vpc_route_table_tags

}

module "aws_route_table_assoc" {
  source                          = "./modules/aws_vpc_route_table_assoc"
  for_each                        = var.vpc_route_table_assoc_profile
  aws_subnet_id                   = module.aws_subnet[each.value.subnet_name].aws_subnet_id
  aws_route_table_id              = module.aws_route_table[each.value.route_table_name].vpc_route_table_id
  vpc_route_table_ipv4_cidr_block = each.value.vpc_route_table_ipv4_cidr_block

}

module "aws_eks_cluster" {
  source           = "./modules/aws_eks_cluster"
  for_each         = var.eks_cluster_profile
  eks_cluster_name = each.value.eks_cluster_name
  vpc_subnet_ids   = [module.aws_subnet[each.value.subnets[0]].aws_subnet_id, module.aws_subnet[each.value.subnets[1]].aws_subnet_id, module.aws_subnet[each.value.subnets[2]].aws_subnet_id, module.aws_subnet[each.value.subnets[3]].aws_subnet_id]
  tags             = each.value.aws_eks_tags
}

module "aws_eks_node_group" {
  source                        = "./modules/aws_eks_node_group"
  for_each                      = var.eks_node_group_profile
  eks_cluster_name              = module.aws_eks_cluster[each.value.cluster_name].prod_eks_cluster_name
  node_group_name               = each.value.node_group_name
  node_iam_role                 = each.value.node_iam_role
  vpc_subnet_ids                = [module.aws_subnet[each.value.subnets[0]].aws_subnet_id, module.aws_subnet[each.value.subnets[1]].aws_subnet_id]
  eks_node_group_instance_types = each.value.eks_node_group_instance_types
  tags                          = each.value.aws_eks_node_group_tags
}