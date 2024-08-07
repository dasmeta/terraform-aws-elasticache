module "alerts" {
  source  = "dasmeta/monitoring/aws//modules/alerts"
  version = "1.5.7"

  count = var.member_clusters_count

  sns_topic = var.alarms.topic

  alerts = [
    {
      name                = "${var.name} Redis cluster ${var.name}-00${count.index + 1} node memory usage state changed."
      description         = "Redis Cluster CPU state monitoring. Check 'Current State' and Reason in notification for details."
      source              = "AWS/ElastiCache/CPUUtilization"
      comparison_operator = try(var.alarms.custom_values.cpu.comparison_operator, "gt")
      statistic           = try(var.alarms.custom_values.cpu.statistic, "avg")
      threshold           = try(var.alarms.custom_values.cpu.threshold, 95)
      period              = try(var.alarms.custom_values.cpu.period, 300)
      filters = {
        CacheClusterId = element(tolist(var.cacheclusterids), count.index)
      }
    },
    {
      name                = "${var.name} Redis cluster ${var.name}-00${count.index + 1} node memory usage state changed."
      description         = "Redis Cluster Memory state monitoring. Check 'Current State' and Reason in notification for details."
      source              = "AWS/ElastiCache/DatabaseMemoryUsagePercentage"
      comparison_operator = try(var.alarms.custom_values.memory.comparison_operator, "gt")
      statistic           = try(var.alarms.custom_values.memory.statistic, "avg")
      threshold           = try(var.alarms.custom_values.memory.threshold, 95)
      period              = try(var.alarms.custom_values.memory.period, 300)
      filters = {
        CacheClusterId = element(tolist(var.cacheclusterids), count.index)
      }
    },
    {
      name                = "${var.name} Redis cluster ${var.name}-00${count.index + 1} connection increased."
      description         = "Redis Cluster Connections monitoring. Check 'Current State' and Reason in notification for details."
      source              = "AWS/ElastiCache/DatabaseMemoryUsagePercentage"
      comparison_operator = try(var.alarms.custom_values.connections.comparison_operator, "gt")
      statistic           = try(var.alarms.custom_values.connections.statistic, "avg")
      threshold           = try(var.alarms.custom_values.connections.threshold, 100)
      period              = try(var.alarms.custom_values.connections.period, 300)
      filters = {
        CacheClusterId = element(tolist(var.cacheclusterids), count.index)
      }
    },
  ]
}
