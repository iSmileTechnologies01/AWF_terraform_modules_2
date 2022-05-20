

output "role_id" {
   description = "id of iam role "
   value = aws_iam_role.test_role.id
}
