module "alerts" {
  source  = "dasmeta/monitoring/aws//modules/alerts"
  version = "1.5.7"

  count = try(var.alarms.enabled, false) ? local.member_clusters_count : 0

  sns_topic = var.alarms.topic

  alerts = [
    {
      name                = "${var.name} Redis cluster ${var.name}-00${count.index + 1} node memory usage state changed."
      description         = "Redis Cluster CPU state monitoring. Check 'Current State' and Reason in notification for details."
      source              = "AWS/ElastiCache/CPUUtilization"
      comparison_operator = "gt"
      statistic           = "avg"
      threshold           = var.alarms.threshold
      filters = {
        CacheClusterId = element(tolist(module.redis.member_clusters[0]), count.index)
      }
    },
    {
      name                = "${var.name} Redis cluster ${var.name}-00${count.index + 1} node memory usage state changed."
      description         = "Redis Cluster Memory state monitoring. Check 'Current State' and Reason in notification for details."
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
