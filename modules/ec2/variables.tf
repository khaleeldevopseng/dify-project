variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-036841078a4b68e14"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t3.medium"
}

variable "subnet_id" {
  description = "The subnet ID where the instance will be launched"
  type        = string
  default     = "subnet-0123456789abcdef" # Replace with a valid subnet ID
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {
    Name        = "dify-instance"
    Environment = "dev"
    Project     = "example"
  }
}
