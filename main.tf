module "network" {
  source     = "./modules/network"
  proj_name  = var.proj_name
  vpc_cidr   = var.vpc_cidr
  sub_a_cidr = var.sub_a_cidr
  sub_b_cidr = var.sub_b_cidr
  sub_a_az   = var.sub_a_az
  sub_b_az   = var.sub_b_az
}