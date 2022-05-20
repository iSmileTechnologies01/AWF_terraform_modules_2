

output "iam_group_membership_users" {
   description = "users of iam group membership "
   value =aws_iam_group_membership.team.users
}
