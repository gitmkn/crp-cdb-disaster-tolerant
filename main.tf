terraform {
  required_providers {
    tencentcloud = {
      source = "tencentcloudstack/tencentcloud"
    }
  }
}

provider "tencentcloud" {
  alias  = "guangzhou"
  region = "ap-guangzhou"
}

provider "tencentcloud" {
  alias  = "shanghai"
  region = "ap-shanghai"
}


module "vpc-guangzhou" {
  source   = "./modules/vpc"
  providers = {
    tencentcloud = tencentcloud.guangzhou
  }

  vpc_name          = var.vpc_name-guangzhou
  vpc_cidr_block    = var.vpc_cidr_block-guangzhou
  subnet_cidr_block = var.subnet_cidr_block-guangzhou
  subnet_name       = var.subnet_name-guangzhou
  availability_zone = var.availability_zone-guangzhou
}

module "vpc-shanghai" {
  source   = "./modules/vpc"
  providers = {
    tencentcloud = tencentcloud.shanghai
  }

  vpc_name          = var.vpc_name-shanghai
  vpc_cidr_block    = var.vpc_cidr_block-shanghai
  subnet_cidr_block = var.subnet_cidr_block-shanghai
  subnet_name       = var.subnet_name-shanghai
  availability_zone = var.availability_zone-shanghai
}

module "securityGroup-guangzhou" {
  source   = "./modules/securityGroups"
  providers = {
    tencentcloud = tencentcloud.guangzhou
  }

  name        = var.sg_description-guangzhou
  description = var.sg_description-guangzhou
}

module "securityGroup-shanghai" {
  source   = "./modules/securityGroups"
  providers = {
    tencentcloud = tencentcloud.shanghai
  }

  name        = var.sg_name-shanghai
  description = var.sg_description-shanghai
}

module "mysql-master-instance" {
  source   = "./modules/mysql"
  depends_on = [module.vpc-guangzhou, module.securityGroup-guangzhou]
  providers = {
    tencentcloud = tencentcloud.guangzhou
  }

  # master instance
  create_mysql_instance = true
  instance_name         = var.master_instance_name
  root_password         = var.master_instance_password
  security_groups       = [module.securityGroup-guangzhou.security_group_id]
  vpc_id                = module.vpc-guangzhou.vpc_id
  subnet_id             = module.vpc-guangzhou.subnet_id
}

module "mysql-ro-instance" {
  source   = "./modules/mysql"
  depends_on = [module.vpc-guangzhou, module.securityGroup-guangzhou, module.mysql-master-instance]
  providers = {
    tencentcloud = tencentcloud.guangzhou
  }

  # readonly instance
  create_mysql_readonly_instance = true
  master_instance_id    = module.mysql-master-instance.db_instance_id
}

module "mysql-dr-instance" {
  source   = "./modules/mysql"
  depends_on = [module.vpc-shanghai, module.securityGroup-shanghai, module.mysql-master-instance]
  providers = {
    tencentcloud = tencentcloud.shanghai
  }

  # dr instance
  create_mysql_dr_instance = true
  master_instance_id    = module.mysql-master-instance.db_instance_id
  master_region         = var.master_instance_region
  dr_security_groups       = [module.securityGroup-shanghai.security_group_id]
  dr_vpc_id                = module.vpc-shanghai.vpc_id
  dr_subnet_id             = module.vpc-shanghai.subnet_id
}