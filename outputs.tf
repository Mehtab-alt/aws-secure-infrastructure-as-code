output "instance_public_ip" {
  description = "The public IP address of the architected EC2 instance."
  value       = module.ec2_instance.public_ip
}

output "vpc_id" {
  description = "The ID of the foundational VPC."
  value       = module.vpc.vpc_id
}
