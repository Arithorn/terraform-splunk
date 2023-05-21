module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "splunk-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  intra_subnets = var.private_subnet_cidrs
  #public_subnets  = var.public_subnet_cidrs

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}