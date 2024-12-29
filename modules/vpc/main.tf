module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.19" # Adjust this to the version you are using

  vpc_name = "my-vpc"
  cidr     = "10.0.0.0/16"

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
