module "redis" {
  source  = "cloudposse/elasticache-redis/aws"
  version = "0.51.0"

  name                                 = var.name
  vpc_id                               = var.vpc_id
  subnets                              = var.subnet_ids
  availability_zones                   = var.availability_zones
  allowed_security_group_ids           = var.allowed_security_group_ids
  cluster_size                         = var.cluster_size
  instance_type                        = var.instance_type
  apply_immediately                    = var.apply_immediately
  automatic_failover_enabled           = var.automatic_failover_enabled
  engine_version                       = var.engine_version
  family                               = var.family
  at_rest_encryption_enabled           = var.at_rest_encryption_enabled
  transit_encryption_enabled           = var.transit_encryption_enabled
  parameter                            = var.parameters
  cluster_mode_enabled                 = var.cluster_mode_enabled
  cluster_mode_num_node_groups         = var.cluster_mode_num_node_groups
  cluster_mode_replicas_per_node_group = var.cluster_mode_replicas_per_node_group
}
