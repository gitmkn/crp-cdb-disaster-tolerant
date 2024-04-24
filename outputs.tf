output "vpc-shanghai-id" {
  description = "The Id of Shanghai VPC."
  value       = module.vpc-shanghai.vpc_id
}

output "vpc-guangzhou-id" {
  description = "The Id of Guangzhou VPC."
  value       = module.vpc-guangzhou.vpc_id
}
