# alarms

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alerts"></a> [alerts](#module\_alerts) | dasmeta/monitoring/aws//modules/alerts | 1.5.7 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarms"></a> [alarms](#input\_alarms) | Monitor cluster redis nodes and send alarm to specified topic if memory/cpu/connecions crosses | <pre>object({<br>    enabled       = optional(bool, true)<br>    topic         = string<br>    custom_values = optional(any, {})<br>  })</pre> | n/a | yes |
| <a name="input_cacheclusterids"></a> [cacheclusterids](#input\_cacheclusterids) | Cache cluster id or ids | `list(string)` | n/a | yes |
| <a name="input_member_clusters_count"></a> [member\_clusters\_count](#input\_member\_clusters\_count) | Member cluster count | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
