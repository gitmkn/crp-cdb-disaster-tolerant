resource "tencentcloud_mysql_instance" "instance" {
  count = var.create_mysql_instance ? 1 : 0

  instance_name     = var.instance_name
  mem_size          = var.mem_size
  volume_size       = var.volume_size
  availability_zone = var.availability_zone
  cpu               = var.cpu
  engine_version    = var.engine_version
  device_type       = var.device_type
  project_id        = var.project_id
  root_password     = var.root_password
  security_groups   = var.security_groups
  parameters        = var.parameters
  tags              = var.tags

  # payment configuration

  charge_type     = var.charge_type
  prepaid_period  = var.prepaid_period
  auto_renew_flag = var.auto_renew_flag
  force_delete    = var.force_delete

  # network configuration

  internet_service = var.internet_service
  intranet_port    = var.intranet_port
  subnet_id        = var.subnet_id
  vpc_id           = var.vpc_id

  # slave configuration

  first_slave_zone  = var.first_slave_zone
  second_slave_zone = var.second_slave_zone
  slave_deploy_mode = var.slave_deploy_mode
  slave_sync_mode   = var.slave_sync_mode
}

resource "tencentcloud_mysql_readonly_instance" "readonly" {
  count = var.create_mysql_readonly_instance ? 1 : 0

  master_instance_id = var.master_instance_id
  master_region      = var.master_region

  mem_size    = var.ro_mem_size
  cpu         = var.ro_cpu
  volume_size = var.ro_volume_size

  instance_name = var.ro_instance_name
  intranet_port = var.ro_intranet_port
  zone          = var.ro_availability_zone

  tags = var.tags
}
resource "tencentcloud_mysql_dr_instance" "mysql_dr" {
  count = var.create_mysql_dr_instance ? 1 : 0

  master_instance_id = var.master_instance_id
  master_region      = var.master_region

  vpc_id          = var.dr_vpc_id
  subnet_id       = var.dr_subnet_id
  security_groups = var.dr_security_groups

  cpu         = var.dr_cpu
  mem_size    = var.dr_mem_size
  volume_size = var.dr_volume_size

  auto_renew_flag   = var.dr_auto_renew_flag
  slave_deploy_mode = var.dr_slave_deploy_mode
  availability_zone = var.dr_availability_zone
  first_slave_zone  = var.dr_first_slave_zone

  instance_name   = var.dr_instance_name
  intranet_port   = var.dr_intranet_port
  charge_type     = var.dr_charge_type
  device_type     = var.dr_device_type
  prepaid_period  = var.dr_prepaid_period
  project_id      = var.project_id
  slave_sync_mode = var.dr_slave_sync_mode

  tags = var.dr_tags
}