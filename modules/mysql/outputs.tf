output "db_instance_id" {
  description = "The instance id of mysql."
  value       = try(tencentcloud_mysql_instance.instance[0].id, "")
}

output "internet_port" {
  description = "Access port for public access."
  value       = concat(tencentcloud_mysql_instance.instance.*.internet_port, [""])[0]
}

output "intranet_ip" {
  description = "instance intranet IP."
  value       = concat(tencentcloud_mysql_instance.instance.*.intranet_ip, [""])[0]
}
