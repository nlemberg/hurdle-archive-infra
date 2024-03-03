module "network" {
  source       = "./modules/network"
  proj_name    = var.proj_name
  vpc_cidr     = var.vpc_cidr
  subnet_count = var.subnet_count
}

module "eks" {
  source                     = "./modules/eks"
  proj_name                  = var.proj_name
  subnet_ids                 = module.network.subnet_ids
  node_group_instance_types  = var.node_group_instance_types
  node_group_desired_size    = var.node_group_desired_size
  node_group_max_size        = var.node_group_max_size
  node_group_min_size        = var.node_group_min_size
  node_group_max_unavailable = var.node_group_max_unavailable
}