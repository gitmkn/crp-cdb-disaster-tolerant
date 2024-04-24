output "vpc_id" {
  description = "The ID of the VPC."
  value       = tencentcloud_vpc.app.id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = tencentcloud_subnet.app.id
}