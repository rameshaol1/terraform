#Provider
provider "aws" {
  region = var.region
  
}

#Module
module "yourvpc" {
  source = "./module/network"
  
}

#Resource Key Pair
resource "aws_key_pair" "levelup_key" {
  key_name = "levelup_key"
  public_key = file(var.public_key_path)
}

#EC2 Instance
resource "aws_instance" "levelup_instance" {
  ami                       = var.instance_ami
  instance_type             = var.instance_type
  subnet_id                 = module.yourvpc.public_subnet_id
  vpc_security_group_ids    = ["${module.yourvpc.sg_22_id}"]
  key_name                  = aws_key_pair.levelup_key.key_name

  tags = {
		Environment         = var.environment_tag
	}
}