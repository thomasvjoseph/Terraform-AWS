resource "aws_iam_user" "newuser" {
    name = "abc"
    path = "/"
    force_destroy = true
  
}
resource "aws_iam_user_login_profile" "name" {
  user = aws_iam_user.newuser.name
  pgp_key = "keybase:thomas"
  password_reset_required = true
}
resource "aws_iam_user_policy_attachment" "ec2-full" {
  user = aws_iam_user.newuser.name
  policy_arn = aws_iam_policy.ec2-full.arn
}
output "password" {
  value = aws_iam_user_login_profile.name.encrypted_password
}