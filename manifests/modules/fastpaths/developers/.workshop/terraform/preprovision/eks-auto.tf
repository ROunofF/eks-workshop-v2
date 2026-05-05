
data "aws_eks_cluster" "eks_cluster_auto" {
  name = var.eks_cluster_auto_id
}

data "aws_eks_cluster_auth" "this_auto" {
  name = var.eks_cluster_auto_id
}

data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_region" "current" {}

# Provider configuration for EKS Auto Mode
terraform {
  required_version = ">= 1.3"

  required_providers {
    helm = {
      source                = "hashicorp/helm"
      version               = "2.17.0"
      configuration_aliases = [helm.auto_mode]
    }
    kubernetes = {
      source                = "hashicorp/kubernetes"
      version               = "2.38.0"
      configuration_aliases = [kubernetes.auto_mode]
    }
  }
}
