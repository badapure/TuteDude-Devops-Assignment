# AWS region to deploy in
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# AMI ID (Ubuntu)
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0f58b397bc5c1f2e8" # Ubuntu 22.04 LTS in ap-south-1 (Mumbai)
}

# Key pair name for SSH access
variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

# Name prefix for resources
variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "flask-express"
}

# Allowed ingress CIDR (for security group)
variable "allowed_cidr" {
  description = "CIDR block allowed to access instances"
  type        = string
  default     = "0.0.0.0/0"
}
