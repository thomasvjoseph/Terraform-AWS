resource "aws_iam_policy" "ec2-full" {
    name = "ec2-full"
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_account_password_policy" "user-password" {
  minimum_password_length = 8
  require_lowercase_characters = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}