# data "aws_elasticache_replication_group" "bar" {
#   replication_group_id = "example"
# }

# locals {
#   member_clusters_count = var.cluster_mode_enabled ? (var.cluster_mode_num_node_groups * (var.cluster_mode_replicas_per_node_group + 1)) : var.cluster_size
# }
# # data.aws_elasticache_replication_group.this.member_clusters
# data "aws_elasticache_replication_group" "this" {
#   replication_group_id = var.name
# }
