# crp-cdb-disaster-tolerant

[![Deploy-To-Tencent-Cloud.png](https://i.postimg.cc/Y9SjcNrP/Deploy-To-Tencent-Cloud.png)](https://console.cloud.tencent.com/crp/template/template-1nfsug)

Use tf to realize one-click deployment of MySQL disaster recovery in two places and three centers.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >=1.81.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >=1.81.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mysql-dr-instance"></a> [mysql-dr-instance](#module\_mysql-dr-instance) | ./modules/mysql | n/a |
| <a name="module_mysql-master-instance"></a> [mysql-master-instance](#module\_mysql-master-instance) | ./modules/mysql | n/a |
| <a name="module_mysql-ro-instance"></a> [mysql-ro-instance](#module\_mysql-ro-instance) | ./modules/mysql | n/a |
| <a name="module_securityGroup-guangzhou"></a> [securityGroup-guangzhou](#module\_securityGroup-guangzhou) | ./modules/securityGroups | n/a |
| <a name="module_securityGroup-shanghai"></a> [securityGroup-shanghai](#module\_securityGroup-shanghai) | ./modules/securityGroups | n/a |
| <a name="module_vpc-guangzhou"></a> [vpc-guangzhou](#module\_vpc-guangzhou) | ./modules/vpc | n/a |
| <a name="module_vpc-shanghai"></a> [vpc-shanghai](#module\_vpc-shanghai) | ./modules/vpc | n/a |

## Resources


| Name                                                                                                                                                    | Type |
|---------------------------------------------------------------------------------------------------------------------------------------------------------|------|
| [tencentcloud_mysql_instance.ins](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/mysql_instance)             | resource |
| [tencentcloud_mysql_readonly_instance.ro_ins](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/mysql_readonly_instance) | resource |
| [tencentcloud_vpc.vpc](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/vpc)                        | resource |
| [tencentcloud_subnet.subnet](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/subnet)                  | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone-guangzhou"></a> [availability\_zone-guangzhou](#input\_availability\_zone-guangzhou) | The subnet availability zone. | `string` | n/a | yes |
| <a name="input_availability_zone-shanghai"></a> [availability\_zone-shanghai](#input\_availability\_zone-shanghai) | The subnet availability zone. | `string` | n/a | yes |
| <a name="input_master_instance_name"></a> [master\_instance\_name](#input\_master\_instance\_name) | The name of the master instance. | `string` | n/a | yes |
| <a name="input_master_instance_password"></a> [master\_instance\_password](#input\_master\_instance\_password) | The password of the master instance. | `string` | n/a | yes |
| <a name="input_master_instance_region"></a> [master\_instance\_region](#input\_master\_instance\_region) | The regioni of the master instance. | `string` | n/a | yes |
| <a name="input_sg_description-guangzhou"></a> [sg\_description-guangzhou](#input\_sg\_description-guangzhou) | The description of the security group. | `string` | n/a | yes |
| <a name="input_sg_description-shanghai"></a> [sg\_description-shanghai](#input\_sg\_description-shanghai) | The description of the security group. | `string` | n/a | yes |
| <a name="input_sg_name-guangzhou"></a> [sg\_name-guangzhou](#input\_sg\_name-guangzhou) | The name of the security group. | `string` | n/a | yes |
| <a name="input_sg_name-shanghai"></a> [sg\_name-shanghai](#input\_sg\_name-shanghai) | The name of the security group. | `string` | `"security_group_name-1"` | no |
| <a name="input_subnet_cidr_block-guangzhou"></a> [subnet\_cidr\_block-guangzhou](#input\_subnet\_cidr\_block-guangzhou) | The CIDR block for the subnet. | `string` | n/a | yes |
| <a name="input_subnet_cidr_block-shanghai"></a> [subnet\_cidr\_block-shanghai](#input\_subnet\_cidr\_block-shanghai) | The CIDR block for the subnet. | `string` | n/a | yes |
| <a name="input_subnet_name-guangzhou"></a> [subnet\_name-guangzhou](#input\_subnet\_name-guangzhou) | The name of the subnet. | `string` | n/a | yes |
| <a name="input_subnet_name-shanghai"></a> [subnet\_name-shanghai](#input\_subnet\_name-shanghai) | The name of the subnet. | `string` | n/a | yes |
| <a name="input_vpc_cidr_block-guangzhou"></a> [vpc\_cidr\_block-guangzhou](#input\_vpc\_cidr\_block-guangzhou) | The CIDR block for the VPC. | `string` | n/a | yes |
| <a name="input_vpc_cidr_block-shanghai"></a> [vpc\_cidr\_block-shanghai](#input\_vpc\_cidr\_block-shanghai) | The CIDR block for the VPC. | `string` | n/a | yes |
| <a name="input_vpc_name-guangzhou"></a> [vpc\_name-guangzhou](#input\_vpc\_name-guangzhou) | The name of the VPC. | `string` | n/a | yes |
| <a name="input_vpc_name-shanghai"></a> [vpc\_name-shanghai](#input\_vpc\_name-shanghai) | The name of the VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc-guangzhou-id"></a> [vpc-guangzhou-id](#output\_vpc-guangzhou-id) | The Id of Guangzhou VPC. |
| <a name="output_vpc-shanghai-id"></a> [vpc-shanghai-id](#output\_vpc-shanghai-id) | The Id of Shanghai VPC. |
<!-- END_TF_DOCS -->
