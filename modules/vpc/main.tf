// Create vpc resource
resource "tencentcloud_vpc" "app" {
  cidr_block = var.vpc_cidr_block
  name       = var.vpc_name
}

// Create subnet resource
resource "tencentcloud_subnet" "app" {
  vpc_id            = tencentcloud_vpc.app.id
  availability_zone = var.availability_zone
  name              = var.subnet_name
  cidr_block        = var.subnet_cidr_block
}