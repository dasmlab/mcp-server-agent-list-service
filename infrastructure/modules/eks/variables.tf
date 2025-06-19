variable "cluster_name" { type = string }
variable "eks_version" { type = string }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "node_group_ami_type" { type = string }
variable "node_group_instance_types" { type = list(string) }

