provider "aws" {
  region = "us-west-2"
}

# VPC Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.19"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = "dev"
    Project     = "example"
  }
}

# EKS Module
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.26"
  vpc_id          = module.vpc.vpc_id

  # Use 'subnet_ids' instead of 'subnets'
  subnet_ids = module.vpc.public_subnets

  # Worker Node Configuration (Updated for the latest versions)
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }

  tags = {
    Environment = "dev"
    Project     = "example"
  }
}

# Uncomment and adjust if you need to pass more specific parameters
# node_groups = {
#   eks_nodes = {
#     desired_capacity = 2
#     max_capacity     = 3
#     min_capacity     = 1
#     instance_type    = "t3.medium"
#   }
# }


module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-05d38da78ce859165"
  instance_type = "t3.medium"
  subnet_id     = module.vpc.public_subnets[0] # First public subnet from the VPC module
  tags = {
    Name        = "dify-instance"
    Environment = "dev"
    Project     = "example"
  }
}