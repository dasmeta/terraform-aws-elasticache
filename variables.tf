variable "name" {
  type        = string
  description = "The name of redis cluster"
}

variable "vpc_id" {
  type        = string
  description = "The vpc where redis cluster will be created"
}

variable "subnets_ids" {
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
  default     = 1
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
  default     = "6.2.6"
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
