resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_helm_version
  namespace        = var.argo_namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/argocd-values.yaml.tpl", {
      dasmlab_live_cicd_repo = var.github_repo_url,
      ghcr_pat               = var.ghcr_pat
    })
  ]
}

data "kubernetes_service" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = var.argo_namespace
  }
}

output "argocd_server_url" {
  value = "http://${data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].hostname}:80"
}

