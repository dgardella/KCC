
# Define provider
provider "aws" {
  region = var.region
}

# Create group
resource "aws_iam_group" "group" {
  name = "group_${var.prefix}"
}
# Create user
resource "aws_iam_user" "user" {
  name = "user_${var.prefix}"
}
# Attach user to group
resource "aws_iam_user_group_membership" "group_membership" {
  user = aws_iam_user.user.name
  groups = [aws_iam_group.group.name]
}
# Create role
resource "aws_iam_role" "role" {
  name = "role_${var.prefix}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          "AWS": "arn:aws:iam::${var.aws_account}:root"
        }
      },
    ]
  })
}
# Create policy
resource "aws_iam_policy" "policy" {
 name = "policy_${var.prefix}"
 policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AccessObject",
      "Effect": "Allow",
      "Action": [
        "sts:AssumeRole"
      ],
      "Resource": [
        "${aws_iam_role.role.arn}"
      ]
    }
  ]
}
EOF
}
# Attach policy to role
resource "aws_iam_role_policy_attachment" "policy-attach" {
  role = aws_iam_role.role.name
  policy_arn = "${aws_iam_policy.policy.arn}"
}