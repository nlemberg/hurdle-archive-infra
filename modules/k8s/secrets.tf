# data "aws_secretsmanager_secret_version" "argocd_github_cred_secret" {
#   secret_id = var.argocd_github_secret_arn
# }

data "aws_secretsmanager_secret_version" "argocd_github_pat_secret" {
  secret_id = "arn:aws:secretsmanager:us-east-1:644435390668:secret:nl-argocd-github-pat-I6nzKM"
}

resource "kubernetes_secret" "argocd_github_cred" {
  metadata {
    name      = "argocd-github-cred"
    namespace = "argocd"

    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    name     = "argocd-github-cred"
    type     = "git"
    url      = "https://github.com/nlemberg/hurdle-archive-gitops.git"
    username = jsondecode(data.aws_secretsmanager_secret_version.argocd_github_pat_secret.secret_string)["username"]
    password = jsondecode(data.aws_secretsmanager_secret_version.argocd_github_pat_secret.secret_string)["password"]
    # url           = var.gitops_repo_url
    # sshPrivateKey = data.aws_secretsmanager_secret_version.argocd_github_cred_secret.secret_string
    # sshPrivateKey = trimspace(replace(data.aws_secretsmanager_secret_version.argocd_github_cred_secret.secret_string, "\r", ""))
  }

  type = "Opaque"

  # depends_on = [helm_release.argocd]
}

data "aws_secretsmanager_secret_version" "argocd_admin_pass_secret" {
  secret_id = var.argocd_admin_pass_arn
}

resource "kubernetes_secret" "argocd_admin_pass" {
  metadata {
    name      = "argocd-admin-pass"
    namespace = "argocd"
  }

  data = {
    name      = "argocd-admin-pass"
    adminPass = data.aws_secretsmanager_secret_version.argocd_admin_pass_secret.secret_string
  }

  type = "Opaque"

  depends_on = [kubernetes_namespace.argocd_namespace]

}

