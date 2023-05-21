module "indexer_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "indexer-service"
  description = "Security group for indexer-service with custom ports"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    for port in var.indexer_ports:
    {
      from_port   = port
      to_port     = port
      protocol    = "tcp"
      description = "indexer-service ports"
      cidr_blocks = var.indexer_source
    }
  ]
}

module "searchhead_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "searchhead-service"
  description = "Security group for searchhead-service with custom ports"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    for port in var.searchhead_ports:
    {
      from_port   = port
      to_port     = port
      protocol    = "tcp"
      description = "searchhead-service ports"
      cidr_blocks = var.searchhead_source
    }
  ]
}

module "clustermaster_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "clustermaster-service"
  description = "Security group for clustermaster-service with custom ports"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    for port in var.clustermaster_ports:
    {
      from_port   = port
      to_port     = port
      protocol    = "tcp"
      description = "clustermaster-service ports"
      cidr_blocks = var.clustermaster_source
    }
  ]
}

module "deploymentserver_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "deploymentserver-service"
  description = "Security group for deploymentserver-service with custom ports"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    for port in var.deploymentserver_ports:
    {
      from_port   = port
      to_port     = port
      protocol    = "tcp"
      description = "deploymentserver-service ports"
      cidr_blocks = var.deploymentserver_source
    }
  ]
}