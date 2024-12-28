module "vpc" {
  source  = "./modules/vpc"
  name    = "dify-vpc"
  cidr    = "10.0.0.0/16"
  azs     = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "dify-cluster"
  cluster_version = "1.21"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
}

module "ec2" {
  source         = "./modules/ec2"
  ami_id         = "ami-0abcdef1234567890"
  instance_type  = "t3.medium"
  subnet_id      = module.vpc.public_subnets[0]
  key_name       = "my-key"
  private_key_path = "~/.ssh/id_rsa"
  instance_name  = "dify-instance"
}