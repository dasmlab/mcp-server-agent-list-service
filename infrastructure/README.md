## Infrastructure Setup

This folder is the base Terraform workflow that we use. 


# Goal: 
A TF module that sets up a AWS VPC with all the bbells and whistles we need and then deploys an EKS cluster, installs ArgoCD on it and then points that back to our dasmlab_live_cicd repo - our control repo for fluxcd/argocd based deployments.


# Method:
	- We will use the AWS VPC Terraform modules - link found here: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
	- We will use the AWS EKS Terraform modules - link found here: https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest

# Steps that we need to do:

	1 - Deploy a VPC setup for our purposes
	2 - Deploy a EKS cluster in that VPC 
	3 - Obtain the Kubebconfig for the cluster in a programtic manner to pass to next steps
	4 - Deploy and Configured ArgoCO on the new EKS cluster and point it to our dasmlab-live-cicd repo (this holds our production/'live' manifests) - https://github.com/lmcdasm/dasmlab-live-cicd
	5 - Outputs that we want to surface (securely)
		ArgoCD admin password and the endpoint
		Output EKS cluster endpoint
		
		
# TF folder layout (this folder)

modules/
  vpc/
  eks/
  argocd/
main.tf       <-- Orchestrates the overall flow
variables.tf  <-- Declares all the input vars
outputs.tf    <-- Describes the outputs that we want to get from vars when the job is done

