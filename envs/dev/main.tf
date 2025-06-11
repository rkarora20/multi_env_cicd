# main.tf

provider "aws" {
  region = "us-east-1"  # or your desired region
}

module "vpc" {
  source               = "../../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  environment          = var.environment
}

module "security_groups" {
  source      = "../../modules/security_groups"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

module "ec2" {
  source            = "../../modules/ec2"
  ami_id            = "ami-0c101f26f147fa7fd" # Choose based on your region
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.private_subnet_ids[0]
  security_group_id = module.security_groups.app_sg_id
  key_name          = "multi_env"
  environment       = var.environment
}

module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.security_groups.web_sg_id
  instance_id       = module.ec2.instance_id
  environment       = var.environment
}
