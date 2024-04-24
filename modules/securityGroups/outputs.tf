output "security_group_id" {
  description = "The ID of the security group."
  value       = tencentcloud_security_group.sg.id
}