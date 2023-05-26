# terraform-aws-account

## this module allows to configure aws account level resources which are not part to specific environment/application and are global impact on aws

## basic example
```hcl
module "account" {
  source  = "dasmeta/account/aws"
  version = "x.y.z"

  create_cloudwatch_log_role = true
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_redis"></a> [redis](#module\_redis) | cloudposse/elasticache-redis/aws | 0.51.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_security_group_ids"></a> [allowed\_security\_group\_ids](#input\_allowed\_security\_group\_ids) | The security groups which allowed-to/opened access redis cluster | `list(string)` | `[]` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Whether to apply the changes immediately | `bool` | `true` | no |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Whether to enable encryption at rest | `bool` | `false` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Whether to enable failover | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The list of availability zones which will be used for creating redis cluster | `list(string)` | `[]` | no |
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | Whether to creation native redis cluster | `bool` | `false` | no |
| <a name="input_cluster_mode_num_node_groups"></a> [cluster\_mode\_num\_node\_groups](#input\_cluster\_mode\_num\_node\_groups) | Number of node groups (shards) for this Redis replication group | `number` | `0` | no |
| <a name="input_cluster_mode_replicas_per_node_group"></a> [cluster\_mode\_replicas\_per\_node\_group](#input\_cluster\_mode\_replicas\_per\_node\_group) | Number of replica nodes in each node group | `number` | `0` | no |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Number of nodes in cluster | `string` | `1` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of redis engine | `string` | `"6.2.6"` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the ElastiCache parameter group | `string` | `"redis6.x"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The nodes instance type in cluster | `string` | `"cache.t2.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of redis cluster | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of ElastiCache parameters to apply | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_subnets_ids"></a> [subnets\_ids](#input\_subnets\_ids) | The list of subnet ids which will be used for creating redis cluster | `list(string)` | `[]` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Whether to enable encryption in transit | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The vpc where redis cluster will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Elasticache Replication Group ARN |
| <a name="output_cluster_enabled"></a> [cluster\_enabled](#output\_cluster\_enabled) | Indicates if cluster mode is enabled |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Redis primary or configuration endpoint, whichever is appropriate for the given cluster mode |
| <a name="output_engine_version_actual"></a> [engine\_version\_actual](#output\_engine\_version\_actual) | The running version of the cache engine |
| <a name="output_host"></a> [host](#output\_host) | Redis hostname |
| <a name="output_id"></a> [id](#output\_id) | Redis cluster ID |
| <a name="output_member_clusters"></a> [member\_clusters](#output\_member\_clusters) | Redis cluster members |
| <a name="output_port"></a> [port](#output\_port) | Redis port |
| <a name="output_reader_endpoint_address"></a> [reader\_endpoint\_address](#output\_reader\_endpoint\_address) | The address of the endpoint for the reader node in the replication group, if the cluster mode is disabled. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the created security group |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the created security group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
