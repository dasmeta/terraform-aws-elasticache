variable "name" {
  type        = string
  description = "The name of redis cluster"
}

variable "vpc_id" {
  type        = string
  description = "The vpc where redis cluster will be created"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The list of subnet ids which will be used for creating redis cluster"
  default     = []
}

variable "availability_zones" {
  type        = list(string)
  description = "The list of availability zones which will be used for creating redis cluster"
  default     = []
}

variable "allowed_security_group_ids" {
  type        = list(string)
  default     = []
  description = "The security groups which allowed-to/opened access redis cluster"
}

variable "cluster_size" {
  type        = string
  default     = 2
  description = "Number of nodes in cluster"
}

variable "instance_type" {
  type        = string
  default     = "cache.t2.micro"
  description = "The nodes instance type in cluster"
}

variable "apply_immediately" {
  type        = bool
  default     = true
  description = "Whether to apply the changes immediately"
}

variable "automatic_failover_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable failover"
}

variable "engine_version" {
  type        = string
  default     = "6.2"
  description = "The version of redis engine"
}

variable "family" {
  type        = string
  default     = "redis6.x"
  description = "The family of the ElastiCache parameter group"
}

variable "at_rest_encryption_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable encryption at rest"
}

variable "transit_encryption_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable encryption in transit"
}

variable "parameters" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "A list of ElastiCache parameters to apply"
}

variable "cluster_mode_enabled" {
  type        = bool
  default     = false
  description = "Whether to creation native redis cluster"
}

variable "cluster_mode_num_node_groups" {
  type        = number
  default     = 0
  description = "Number of node groups (shards) for this Redis replication group"
}

variable "cluster_mode_replicas_per_node_group" {
  type        = number
  default     = 0
  description = "Number of replica nodes in each node group"
}

variable "create_security_group" {
  type        = bool
  default     = true
  description = "Whether to create new security group. If false, associated_security_group_ids must be provided."
}

variable "associated_security_group_ids" {
  type        = list(string)
  default     = []
  description = "Security group ids to associate/use for in case you have them created already and do not want to use new created one by setting create_security_group=false"
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Subnet group name to use for Redis cluster, to not generate new one"
  default     = ""
}

variable "log_delivery_configuration" {
  type        = list(map(any))
  default     = []
  description = "Allows configure Redis SLOWLOG or Redis Engine Log to CloudWatch Logs or Kinesis Data Firehose. Max of 2 blocks."
}

variable "snapshot_arns" {
  type        = list(string)
  description = "A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my_bucket/snapshot1.rdb"
  default     = []
}

variable "snapshot_name" {
  type        = string
  description = "The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource."
  default     = null
}

variable "snapshot_window" {
  type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  default     = "06:30-07:30"
}

variable "snapshot_retention_limit" {
  type        = number
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  default     = 0
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made."
  default     = null
}

variable "alarms" {
  type = object({
    enabled       = optional(bool, true)
    topic         = string
    custom_values = optional(any, {})
  })
  description = "Monitor cluster redis nodes and send alarm to specified topic if memory/cpu/connecions crosses"
}
