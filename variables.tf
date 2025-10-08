variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The overall CIDR block for the network foundation (VPC)."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch (e.g., t2.micro, t3.medium)."
  type        = string
  default     = "t2.micro"
}
