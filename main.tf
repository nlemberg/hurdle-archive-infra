module "network" {
  source       = "./modules/network"
  proj_name    = var.proj_name
  vpc_cidr     = var.vpc_cidr
  subnet_count = var.subnet_count
}