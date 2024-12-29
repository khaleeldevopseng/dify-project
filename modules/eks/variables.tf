variable "subnet_ids" {
  description = "List of subnet IDs where EKS nodes will be provisioned."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "example"
  }
}