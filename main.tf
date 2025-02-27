module "redis" {
  source  = "cloudposse/elasticache-redis/aws"
  version = "1.9.0"

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
  transit_encryption_mode              = var.transit_encryption_mode
  parameter                            = var.parameters
  cluster_mode_enabled                 = var.cluster_mode_enabled
  cluster_mode_num_node_groups         = var.cluster_mode_num_node_groups
  cluster_mode_replicas_per_node_group = var.cluster_mode_replicas_per_node_group
  create_security_group                = var.create_security_group
  associated_security_group_ids        = var.associated_security_group_ids
  elasticache_subnet_group_name        = var.elasticache_subnet_group_name
  log_delivery_configuration           = var.log_delivery_configuration
  snapshot_arns                        = var.snapshot_arns
  snapshot_name                        = var.snapshot_name
  snapshot_window                      = var.snapshot_window
  snapshot_retention_limit             = var.snapshot_retention_limit
  final_snapshot_identifier            = var.final_snapshot_identifier
  auth_token                           = var.auth_token
  additional_security_group_rules      = var.additional_security_group_rules
}
