# The specification sheet for our VPC component.
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC. This is the main input specification."
  type        = string
}
