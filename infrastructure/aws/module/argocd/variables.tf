variable "argo_namespace" { type = string }
variable "argocd_helm_version" { type = string }
variable "github_repo_url" { type = string }

## INJECT GITHUB PAT TOKEN
variable "ghcr_pat" {
  type = string
  sensitive = true
}

