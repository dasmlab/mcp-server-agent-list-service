module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.eks_version

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  eks_managed_node_group_defaults = {
    ami_type       = var.node_group_ami_type
    instance_types = var.node_group_instance_types
  }

  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
output "cluster_ca" {
  value = module.eks.cluster_certificate_authority_data
}
output "cluster_token" {
  value = module.eks.cluster_oidc_issuer_url
}
output "kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}

