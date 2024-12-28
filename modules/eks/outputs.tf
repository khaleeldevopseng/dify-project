output "cluster_id" {
  value = module.eks.cluster_id
}

output "node_group_arn_primary" {
  value = aws_eks_node_group.example.arn
}

output "node_group_arn_secondary" {
  value = aws_eks_node_group.another_example.arn
}

