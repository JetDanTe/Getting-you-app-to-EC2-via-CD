provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./modules/network"
}

module "ec2" {
  source          = "./modules/ec2"
  key_name        = var.key_name
  subnet_id       = module.network.public_subnet_id
  security_group_id = module.network.security_group_id
}
