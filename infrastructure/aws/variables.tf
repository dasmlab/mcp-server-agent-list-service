variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Account/Profile"
  type        = string
  default     = "dasmlab"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "dasmlab-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "dasmlab-eks"
}

variable "eks_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "eks_node_count" {
  description = "EKS Node Count"
  type        = string
  default     = "1"
}

variable "node_group_ami_type" {
  description = "EKS node group AMI type"
  type        = string
  default     = "AL2_x86_64"
}

variable "node_group_instance_types" {
  description = "Instance types for EKS nodes"
  type        = list(string)
  default     = ["t3.small"]
}

variable "argo_namespace" {
  description = "Namespace for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argocd_helm_version" {
  description = "Version of the ArgoCD Helm chart"
  type        = string
  default     = "6.7.9"
}

variable "argocd_chart_version" {
  description = "Version of the ArchCD Chart (duplicate for backward compat)"
  type        = string
  default     = "6.7.9"
}

variable "dasmlab_live_cicd_repo" {
  description = "URL for dasmlab_live_cicd GitOps repo"
  type        = string
  default     = "https://github.com/lmcdasm/dasmlab_live_cicd.git"
}

variable "ghcr_pat" {
  description = "GHCR Token for Registry"
  type        = string
  sensitive   = true
}

