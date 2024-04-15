data "aws_secretsmanager_secret_version" "argocd_github_pat_secret" {
  secret_id = var.argocd_github_secret_arn
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
  }

  type = "Opaque"

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

data "aws_secretsmanager_secret_version" "hurdle_db_secret" {
  secret_id = var.hurdle_db_secret_arn
}

resource "kubernetes_secret" "hurdle_db_cred" {
  metadata {
    name      = "mysql-secret"
    namespace = "hurdle"
  }

  data = {
    DATABASE_URL        = jsondecode(data.aws_secretsmanager_secret_version.hurdle_db_secret.secret_string)["DATABASE_URL"]
    mysql-root-password = jsondecode(data.aws_secretsmanager_secret_version.hurdle_db_secret.secret_string)["mysql-root-password"]
    mysql-password      = jsondecode(data.aws_secretsmanager_secret_version.hurdle_db_secret.secret_string)["mysql-password"]
  }

  type = "Opaque"

  depends_on = [kubernetes_namespace.hurdle_namespace]

}