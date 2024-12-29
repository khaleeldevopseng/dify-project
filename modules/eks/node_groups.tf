resource "aws_eks_node_group" "dify_nodes" {
  cluster_name    = module.eks.cluster_id
  node_group_name = "dify-node-group"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]

  tags = var.tags
}