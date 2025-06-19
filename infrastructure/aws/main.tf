terraform {
  required_version = ">= 1.4"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.22"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.13"
    }
  }
}


provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./module/vpc"
  name = var.vpc_name
  cidr = var.vpc_cidr
}

module "eks" {
  source       = "./module/eks"
  cluster_name = var.cluster_name 
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets 
  eks_version  = var.eks_version
  node_group_ami_type = var.node_group_ami_type
  node_group_instance_types = var.node_group_instance_types
}

provider "kubernetes" {
  host         = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca)
  token        = module.eks.cluster_token
}

provider "helm" {
  kubernetes {
    host       = module.eks.cluster_name
    cluster_ca_certificate = base64decode(module.eks.cluster_ca)
    token      = module.eks.cluster_token
  }
}

module "argocd" {
  source              = "./module/argocd"
  argo_namespace      = var.argo_namespace
  argocd_helm_version = var.argocd_helm_version
  github_repo_url     = var.dasmlab_live_cicd_repo
  ghcr_pat            = var.ghcr_pat
}


		
