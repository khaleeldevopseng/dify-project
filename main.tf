provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "./modules/vpc"
  name    = var.vpc_name
  cidr    = var.vpc_cidr
  azs     = var.azs

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  tags = var.tags
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  tags = var.tags
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = module.vpc.public_subnets[0] # Use public subnets for EC2
  vpc_id        = module.vpc.vpc_id # Ensure the VPC ID is passed here if needed

  tags = var.tags
}