module "vpc" {
  source           = "../../modules/vpc"
  environment_name = var.environment_name
  vpc_cidr         = var.vpc_cidr
  subnet_newbits   = var.subnet_newbits
  tags             = var.tags
}

module "eks" {
  source = "../../modules/eks"

  aws_region                           = var.aws_region
  environment_name                     = var.environment_name
  business_division                    = var.business_division
  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  cluster_service_ipv4_cidr            = var.cluster_service_ipv4_cidr
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  #tags                                 = var.tags
  node_instance_types                  = var.node_instance_types
  node_capacity_type                   = var.node_capacity_type
  node_disk_size                       = var.node_disk_size
}