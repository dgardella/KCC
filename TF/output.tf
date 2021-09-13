
output "user_name" {
    value = aws_iam_user.user.name
}

output "group_name" {
    value = aws_iam_group.group.name
}

output "role_name" {
    value = aws_iam_role.role.name
}

output "role_arn" {
    value = aws_iam_role.role.arn
}
