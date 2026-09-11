variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "environment_name" {
  description = "Environment name used in resource names and tags"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block for VPC"
  default     = "10.0.0.0/16"
  type        = string
}

variable "subnet_newbits" {
  description = "Number of new bits to add to VPC CIDR to generate subnets (e.g., 8 means /24 from /16)"
  type        = number
  default     = 8
}

variable "tags" {
  description = "Global tags to apply to all resources"
  type        = map(string)
  default = {
    Terraform = "true"
  }
}

# Business unit or department (used in tags and naming)
variable "business_division" {
  description = "Business Division in the large organization this infrastructure belongs to"
  type        = string
  default     = "retail"
}

# --------------------------------------------------------
# EKS Cluster Configuration
# --------------------------------------------------------

# Name of the EKS cluster (used in names, tags, and references)
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemo"
}

# Kubernetes version for the EKS control plane
variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (e.g. 1.28, 1.29)"
  type        = string
  default     = null
}

# CIDR block used for Kubernetes service networking
variable "cluster_service_ipv4_cidr" {
  description = "Service CIDR range for Kubernetes services. Optional — leave null to use AWS default."
  type        = string
  default     = null
}

# Enable access to the EKS API via private endpoint
variable "cluster_endpoint_private_access" {
  description = "Whether to enable private access to EKS control plane endpoint"
  type        = bool
  default     = false
}

# Enable access to the EKS API via public endpoint
variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access to EKS control plane endpoint"
  type        = bool
  default     = true
}

# List of CIDRs allowed to reach the public EKS API endpoint
variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks allowed to access public EKS endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# --------------------------------------------------------
# EKS Node Group Configuration
# --------------------------------------------------------

# EC2 instance types for worker nodes
variable "node_instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
  default     = ["c7i-flex.large"]
}

# Capacity type for node group (ON_DEMAND or SPOT)
variable "node_capacity_type" {
  description = "Instance capacity type: ON_DEMAND or SPOT"
  type        = string
  default     = "ON_DEMAND"
}

# Root volume size (GiB) for worker nodes
variable "node_disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}