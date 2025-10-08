# THE ARCHITECT'S BLUEPRINT
# We define WHAT we want and HOW components connect, not the low-level details.

# 1. Dynamically find the latest approved Amazon Linux 2 AMI
# This makes our blueprint resilient to AMI updates.
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# 2. Commission the network foundation from our VPC factory.
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
}

# 3. Commission a secure server from our EC2 factory.
# We connect it to the foundation by wiring the outputs from the VPC module
# into the inputs of the EC2 module.
module "ec2_instance" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  ami_id        = data.aws_ami.latest_amazon_linux.id # Dynamic AMI

  # The critical supply chain connections:
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
}
