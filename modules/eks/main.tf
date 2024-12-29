module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.26"
  version = "~> 18.0"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = var.subnet_ids

  tags = var.tags
}