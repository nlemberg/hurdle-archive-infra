module "network" {
  source       = "./modules/network"
  proj_name    = var.proj_name
  vpc_cidr     = var.vpc_cidr
  subnet_count = var.subnet_count
}

module "eks" {
  source                     = "./modules/eks"
  proj_name                  = var.proj_name
  depends_on                 = [module.network]
  subnet_ids                 = module.network.subnet_ids
  node_group_instance_types  = var.node_group_instance_types
  node_group_desired_size    = var.node_group_desired_size
  node_group_max_size        = var.node_group_max_size
  node_group_min_size        = var.node_group_min_size
  node_group_max_unavailable = var.node_group_max_unavailable
}

module "k8s" {
  source                   = "./modules/k8s"
  depends_on               = [module.eks]
  gitops_repo_url          = var.gitops_repo_url
  argocd_values_filepath   = "${path.module}/manifests/argocd-values.yaml"
  argocd_app_filepath      = "${path.module}/manifests/argocd-app.yaml"
  argocd_github_secret_arn = var.argocd_github_secret_arn
  argocd_admin_pass_arn    = var.argocd_admin_pass_arn
  hurdle_db_secret_arn     = var.hurdle_db_secret_arn
}