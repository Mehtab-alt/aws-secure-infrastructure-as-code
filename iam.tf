# Establishes a trust relationship between your AWS account and your GitHub repository.
# This allows GitHub Actions to assume a role instead of using static keys.

resource "aws_iam_oidc_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  # Standard GitHub OIDC thumbprint
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "github_actions_role" {
  name = "github-actions-terraform-role"

  # Trust policy allowing your specific GitHub repo to assume this role.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRoleWithWebIdentity"
        Principal = {
          Federated = aws_iam_oidc_provider.github.arn
        }
        Condition = {
          StringLike = {
            # IMPORTANT: Update this with your GitHub username and repository name.
            "token.actions.githubusercontent.com:sub" : "repo:YourGitHubUsername/YourRepoName:*"
          }
        }
      }
    ]
  })
}

# In production, you should create a more restrictive policy.
resource "aws_iam_role_policy_attachment" "github_actions_admin" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "github_actions_role_arn" {
  description = "The ARN of the IAM role for GitHub Actions."
  value       = aws_iam_role.github_actions_role.arn
}
