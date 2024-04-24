# guangzhou
variable "vpc_name-guangzhou" {
  description = "The name of the VPC."
  type        = string
}

variable "vpc_cidr_block-guangzhou" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "subnet_name-guangzhou" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_cidr_block-guangzhou" {
  description = "The CIDR block for the subnet."
  type        = string
}

variable "availability_zone-guangzhou" {
  description = "The subnet availability zone."
  type        = string
}

variable "sg_name-guangzhou" {
  description = "The name of the security group."
  type        = string
}

variable "sg_description-guangzhou" {
  description = "The description of the security group."
  type        = string
}

# shanghai
variable "vpc_name-shanghai" {
  description = "The name of the VPC."
  type        = string
}

variable "vpc_cidr_block-shanghai" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "subnet_name-shanghai" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_cidr_block-shanghai" {
  description = "The CIDR block for the subnet."
  type        = string
}

variable "availability_zone-shanghai" {
  description = "The subnet availability zone."
  type        = string
}

variable "sg_name-shanghai" {
  description = "The name of the security group."
  type        = string
  default     = "security_group_name-1"
}

variable "sg_description-shanghai" {
  description = "The description of the security group."
  type        = string
}


# mysql
variable "master_instance_name" {
  description = "The name of the master instance."
  type        = string
}

variable "master_instance_region" {
  description = "The regioni of the master instance."
  type        = string
}

variable "master_instance_password" {
  description = "The password of the master instance."
  type        = string
}