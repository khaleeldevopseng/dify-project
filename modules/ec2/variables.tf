variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key for SSH"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}