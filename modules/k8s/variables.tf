variable "argocd_values_filepath" {
    description = "path to the values.yaml for argocd"
  type        = string
}

variable "argocd_app_filepath" {
    description = "path to the app-of-apps.yaml for argocd"
  type        = string
}

variable "gitops_repo_url" {
  type        = string
}

variable "argocd_github_secret_arn" {
  description = "arn of secret github credentials for argocd "
  type        = string
}

variable "argocd_admin_pass_arn" {
  description = "arn of argocd admin password"
  type        = string
}
