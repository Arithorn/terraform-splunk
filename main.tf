resource "aws_instance" "indexer_servers" {
  ami           = data.aws_ami.aws_linux_ami.id
  instance_type = var.indexer_instance_type
  count = var.indexer_count_per_subnet * length(module.vpc.intra_subnets)
  subnet_id = module.vpc.intra_subnets[count.index % length(module.vpc.intra_subnets)]
  vpc_security_group_ids = [module.indexer_service_sg.security_group_id]
  tags = {
    Name = "Indexer",
    Env = var.environment
    Owner = var.owner
  }
}

resource "aws_instance" "searchhead_servers" {
  ami           = data.aws_ami.aws_linux_ami.id
  instance_type = var.searchhead_instance_type
  count = var.searchhead_count_per_subnet * length(module.vpc.intra_subnets)
  subnet_id = module.vpc.intra_subnets[count.index % length(module.vpc.intra_subnets)]
  vpc_security_group_ids = [module.searchhead_service_sg.security_group_id]
  tags = {
    Name = "Searchhead",
    Env = var.environment,
    Owner = var.owner
  }
}

resource "aws_instance" "clustermaster_servers" {
  ami           = data.aws_ami.aws_linux_ami.id
  instance_type = var.clustermaster_instance_type
  #count = var.searchhead_count_per_subnet * length(module.vpc.intra_subnets)
  #subnet_id = module.vpc.intra_subnets[count.index % length(module.vpc.intra_subnets)]
  subnet_id = module.vpc.intra_subnets[0]
  vpc_security_group_ids = [module.clustermaster_service_sg.security_group_id]
  tags = {
    Name = "Clustermaster",
    Env = var.environment,
    Owner = var.owner
  }
}

resource "aws_instance" "deployment_servers" {
  ami           = data.aws_ami.aws_linux_ami.id
  instance_type = var.deploymentserver_instance_type
  #count = var.searchhead_count_per_subnet * length(module.vpc.intra_subnets)
  #subnet_id = module.vpc.intra_subnets[count.index % length(module.vpc.intra_subnets)]
  subnet_id = module.vpc.intra_subnets[0]
  vpc_security_group_ids = [module.deploymentserver_service_sg.security_group_id]
  tags = {
    Name = "Clustermaster",
    Env = var.environment,
    Owner = var.owner
  }
}

