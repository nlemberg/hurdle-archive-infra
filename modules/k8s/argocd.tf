resource "kubernetes_namespace" "argocd_namespace" {
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_namespace" "hurdle_namespace" {
  metadata {
    name = "hurdle"
  }
}

data "kubernetes_secret" "argocd_adminpass" {
  metadata {
    name      = "argocd-admin-pass"
    namespace = "argocd"
  }

  depends_on = [kubernetes_secret.argocd_admin_pass]

}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.52.2"

  namespace = "argocd"

  values = [
    "${file(var.argocd_values_filepath)}"
  ]

  set_sensitive {
    name  = "configs.secret.argocdServerAdminPassword"
    value = data.kubernetes_secret.argocd_adminpass.data["adminPass"]
  }

  depends_on = [kubernetes_namespace.argocd_namespace, kubernetes_secret.argocd_admin_pass]
}

resource "kubectl_manifest" "argocd_app" {
  depends_on = [helm_release.argocd, kubernetes_secret.argocd_github_cred]

  yaml_body = file(var.argocd_app_filepath)
}