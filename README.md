# terraform-aws-elasticache

## this module allows to create aws elasticache/redis cluster

## basic example
```hcl
module "redis" {
  source  = "dasmeta/elasticache/aws"
  version = "x.y.z"

  name         = "test-redis"
  vpc_id       = {aws-vpc-id}
  subnet_ids   = {aws-subnet-ids}
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.67 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alarms"></a> [alarms](#module\_alarms) | ./modules/alarms/ | n/a |
| <a name="module_alerts"></a> [alerts](#module\_alerts) | dasmeta/monitoring/aws//modules/alerts | 1.5.7 |
| <a name="module_redis"></a> [redis](#module\_redis) | cloudposse/elasticache-redis/aws | 0.51.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarms"></a> [alarms](#input\_alarms) | Monitor cluster redis nodes and send alarm to specified topic if memory/cpu/connecions crosses | <pre>object({<br>    enabled       = optional(bool, true)<br>    topic         = string<br>    custom_values = optional(any, {})<br>  })</pre> | n/a | yes |
| <a name="input_allowed_security_group_ids"></a> [allowed\_security\_group\_ids](#input\_allowed\_security\_group\_ids) | The security groups which allowed-to/opened access redis cluster | `list(string)` | `[]` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Whether to apply the changes immediately | `bool` | `true` | no |
| <a name="input_associated_security_group_ids"></a> [associated\_security\_group\_ids](#input\_associated\_security\_group\_ids) | Security group ids to associate/use for in case you have them created already and do not want to use new created one by setting create\_security\_group=false | `list(string)` | `[]` | no |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Whether to enable encryption at rest | `bool` | `false` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Whether to enable failover | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The list of availability zones which will be used for creating redis cluster | `list(string)` | `[]` | no |
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | Whether to creation native redis cluster | `bool` | `false` | no |
| <a name="input_cluster_mode_num_node_groups"></a> [cluster\_mode\_num\_node\_groups](#input\_cluster\_mode\_num\_node\_groups) | Number of node groups (shards) for this Redis replication group | `number` | `0` | no |
| <a name="input_cluster_mode_replicas_per_node_group"></a> [cluster\_mode\_replicas\_per\_node\_group](#input\_cluster\_mode\_replicas\_per\_node\_group) | Number of replica nodes in each node group | `number` | `0` | no |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Number of nodes in cluster | `string` | `2` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Whether to create new security group. If false, associated\_security\_group\_ids must be provided. | `bool` | `true` | no |
| <a name="input_elasticache_subnet_group_name"></a> [elasticache\_subnet\_group\_name](#input\_elasticache\_subnet\_group\_name) | Subnet group name to use for Redis cluster, to not generate new one | `string` | `""` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of redis engine | `string` | `"6.2"` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the ElastiCache parameter group | `string` | `"redis6.x"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made. | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The nodes instance type in cluster | `string` | `"cache.t2.micro"` | no |
| <a name="input_log_delivery_configuration"></a> [log\_delivery\_configuration](#input\_log\_delivery\_configuration) | Allows configure Redis SLOWLOG or Redis Engine Log to CloudWatch Logs or Kinesis Data Firehose. Max of 2 blocks. | `list(map(any))` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of redis cluster | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of ElastiCache parameters to apply | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_snapshot_arns"></a> [snapshot\_arns](#input\_snapshot\_arns) | A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my\_bucket/snapshot1.rdb | `list(string)` | `[]` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | The name of a snapshot from which to restore data into the new node group. Changing the snapshot\_name forces a new resource. | `string` | `null` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `number` | `0` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `"06:30-07:30"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The list of subnet ids which will be used for creating redis cluster | `list(string)` | `[]` | no |
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
