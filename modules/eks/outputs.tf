output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the EKS cluster"
  value       = module.eks.cluster_arn
}

output "eks_node_group_arns" {
  description = "List of ARNs of the EKS managed node groups"
  value       = module.eks.node_group_arns
}

output "eks_security_group_id" {
  description = "The security group ID associated with the EKS cluster"
  value       = module.eks.cluster_security_group_id
}