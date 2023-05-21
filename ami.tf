data "aws_ami" "aws_linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = var.ami_name
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
  owners = var.ami_owner

}