# The official connection points for our finished VPC component.

output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet, where other components can be placed."
  value       = aws_subnet.public.id
}
