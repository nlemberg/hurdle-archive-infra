region                     = "us-east-1"
profile                    = "naamal"
bootcamp                   = 19
expiration_date            = "01-04-2024"
proj_name                  = "nl-tf"
vpc_cidr                   = "10.0.0.0/16"
subnet_count               = 2
node_group_instance_types  = "t3a.medium"
node_group_desired_size    = 2
node_group_max_size        = 3
node_group_min_size        = 1
node_group_max_unavailable = 1
gitops_repo_url            = "git@github.com:nlemberg/hurdle-archive-gitops.git"
argocd_github_secret_arn   = "arn:aws:secretsmanager:us-east-1:644435390668:secret:nl-argocd-github-gFLFd8"
argocd_admin_pass_arn      = "arn:aws:secretsmanager:us-east-1:644435390668:secret:nl-argocd-admin-pass-O00byT"