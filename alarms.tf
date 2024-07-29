module "alarms" {
  source = "./modules/alarms/"

  count = try(var.alarms.enabled, false) ? 1 : 0

  name                  = var.name
  alarms                = var.alarms
  member_clusters_count = local.member_clusters_count
  cacheclusterids       = module.redis.member_clusters[0]
}
