variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "tags_for_nodes" {
  description = "Tags for the node group"
  type        = map(string)
}
variable "subnet_ids" {
  description = "Subnets for EKS cluster nodes"
  type        = list(string)
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}

