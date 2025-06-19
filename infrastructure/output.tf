output "argocd_endpoint" {
  value = module.argocd.argocd_server_url
}

output "eks_kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}

