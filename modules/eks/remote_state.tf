data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
      bucket = "ratailotel-terraform-state-vikkichitte"
      key = "vpc/dev/terraform.tfstate"
      region = var.aws_region
    }
}
#VPC ID from remote VPC state
output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.public_subnet_ids
}

output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}