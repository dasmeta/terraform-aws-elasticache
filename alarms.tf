module "alerts" {
  # source = "/home/tigran/projects/devops/dasmeta/terraform-aws-monitoring/modules/alerts"
  source  = "dasmeta/monitoring/aws//modules/alerts"
  version = "1.5.6"

  count = try(var.alarms.enabled, false) ? local.member_clusters_count : 0
  # for_each = { for key, cluster_name in tolist(module.redis.member_clusters[0]) : cluster_name => cluster_name if try(var.alarms.enabled, false) }

  sns_topic = var.alarms.topic

  alerts = [
    {
      name                = "${var.name} Redis cluster ${var.name}-00${count.index + 1} node cpu is overloaded (>${var.alarms.threshold}%)"
      source              = "AWS/ElastiCache/CPUUtilization"
      comparison_operator = "gt"
      statistic           = "avg"
      threshold           = var.alarms.threshold
      filters = {
        CacheClusterId = element(tolist(module.redis.member_clusters[0]), count.index)
      }
    },
    {
      name                = "${var.name} Redis cluster ${var.name}-00${count.index + 1} node memory is overloaded (>${var.alarms.threshold}%)"
      source              = "AWS/ElastiCache/DatabaseMemoryUsagePercentage"
      comparison_operator = "gt"
      statistic           = "avg"
      threshold           = var.alarms.threshold
      filters = {
        CacheClusterId = element(tolist(module.redis.member_clusters[0]), count.index)
      }
    }
  ]
}
