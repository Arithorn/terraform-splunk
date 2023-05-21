variable "indexer_instance_type" {
  default = "t3.micro"
}
variable "searchhead_instance_type" {
  default = "t3.micro"
}
variable "clustermaster_instance_type" {
  default = "t3.micro"
}
variable "deploymentserver_instance_type" {
  default = "t3.micro"
}

variable "environment" {
  default = "DEV"
}

variable "owner" {
  default = "IGS"
}

variable "ami_name" {
    default = ["al2023-*"]
}

variable "ami_owner" {
  default = [ "amazon" ]
}

variable "searchhead_count_per_subnet" {
  default = 1
}
variable "indexer_count_per_subnet" {
  default = 1
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["af-south-1a", "af-south-1b","af-south-1c"]
}

variable "private_subnet_cidrs" {
  type = list(string)
  description = "Private CIDRS"
  default = [ "10.0.1.0/24","10.0.2.0/24","10.0.3.0/24" ]
  
}

variable "indexer_source" {
  default = "0.0.0.0/0"
}

variable "indexer_ports" {
  default = [8000,9000,9999,10001]
}

variable "searchhead_source" {
  default = "0.0.0.0/0"
}

variable "searchhead_ports" {
  default = [8000,9000,8033]
}

variable "clustermaster_source" {
  default = "0.0.0.0/0"
}

variable "clustermaster_ports" {
  default = [8000,9000,8033,9050]
}

variable "deploymentserver_source" {
  default = "0.0.0.0/0"
}

variable "deploymentserver_ports" {
  default = [8000,9000]
}
