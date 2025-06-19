#!/bin/bash
#
#  runme_local.sh - a simple script to run the TF init, tf plan and tf apply 
#
#   this uses the dev.auto.tfvars for local testing / run variables and have to beb set appropraitely
#

# 1. Initialize the working directory
terraform init

# 2. Preview what Terraform will do (shows planned actions)
terraform plan

# 3. (Optional) Apply the plan to provision resources (will create AWS infra etc)
terraform apply

