variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "cdb_app_vpc"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_name" {
  description = "The name of the VPC."
  type        = string
  default     = "cdb_app_subnet"
}

variable "availability_zone" {
  description = "The subnet availability zone."
  type        = string
  default     = "ap-guangzhou-3"
}

