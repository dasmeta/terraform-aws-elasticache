module "alerts" {
  source  = "dasmeta/monitoring/aws//modules/alerts"
  version = "1.5.7"

  count = try(var.alarms.enabled, false) ? local.member_clusters_count : 0

  sns_topic = var.alarms.topic

  alerts = [
    {
      name                = "Redis: High CPU Utilization on ${var.name}-00${count.index + 1} Node in ${var.name} Cluster."
      description         = "Redis Cluster CPU state monitoring. Check 'Current State' and Reason in notification for details."
      source              = "AWS/ElastiCache/CPUUtilization"
      comparison_operator = try(var.alarms.custom_values.cpu.comparison_operator, "gt")
      statistic           = try(var.alarms.custom_values.cpu.statistic, "avg")
      threshold           = try(var.alarms.custom_values.cpu.threshold, 95)
      period              = try(var.alarms.custom_values.cpu.period, 300)
      filters = {
        CacheClusterId = element(tolist(module.redis.member_clusters[0]), count.index)
      }
    },
    {
      name                = "Redis: High Memory Usage on ${var.name}-00${count.index + 1} Node in ${var.name} Cluster."
      description         = "Redis Cluster Memory state monitoring. Check 'Current State' and Reason in notification for details."
      source              = "AWS/ElastiCache/DatabaseMemoryUsagePercentage"
      comparison_operator = try(var.alarms.custom_values.memory.comparison_operator, "gt")
      statistic           = try(var.alarms.custom_values.memory.statistic, "avg")
      threshold           = try(var.alarms.custom_values.memory.threshold, 95)
      period              = try(var.alarms.custom_values.memory.period, 300)
      filters = {
        CacheClusterId = element(tolist(module.redis.member_clusters[0]), count.index)
      }
    },
    {
      name                = "Redis: High Connection Usage on ${var.name}-00${count.index + 1} Node in ${var.name} Cluster."
      description         = "Redis Cluster Connections monitoring. Check 'Current State' and Reason in notification for details."
      source              = "AWS/ElastiCache/DatabaseMemoryUsagePercentage"
      comparison_operator = try(var.alarms.custom_values.connections.comparison_operator, "gt")
      statistic           = try(var.alarms.custom_values.connections.statistic, "avg")
      threshold           = try(var.alarms.custom_values.connections.threshold, 100)
      period              = try(var.alarms.custom_values.connections.period, 300)
      filters = {
        CacheClusterId = element(tolist(module.redis.member_clusters[0]), count.index)
      }
    },
  ]
}
