# The specification sheet for our EC2 component.

variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC. Required to create the security group."
  type        = string
}
