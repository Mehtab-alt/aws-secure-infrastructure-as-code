# Configures the "source of truth" for our infrastructure's state.
# Using a remote backend is non-negotiable for team collaboration.
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket-name" # MUST be globally unique
    key            = "global/web-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-terraform-locks-table" # For state locking
    encrypt        = true
  }
}
