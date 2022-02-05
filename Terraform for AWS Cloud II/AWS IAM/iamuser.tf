#TF files for IAM Users and Groups
resource "aws_iam_user" "adminuser1" {
  name = "adminuser1"
}

resource "aws_iam_user" "adminuser2" {
  name = "adminuser2"
}

#Group TF Definition
resource "aws_iam_group" "admingroup" {
  name  = "admingroup"
}

#Assign users to AWS group
resource "aws_iam_group_membership" "admin-users" {
  name = "admin-users"
  users = [
    aws_iam_user.adminuser1.name,
    aws_iam_user.adminuser2.name
  ]
  group = aws_iam_group.admingroup.name 
}

#Policy for AWS group
resource "aws_iam_policy_attachment" "admin-users-attach" {
  name = "admin-users-attach"
  groups = [aws_iam_group.admingroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}