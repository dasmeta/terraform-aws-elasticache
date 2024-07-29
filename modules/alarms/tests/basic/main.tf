module "alarms" {
  source = "../../"

  member_clusters_count = 1
  cacheclusterids       = ["casino"]
  name                  = "casino"

  alarms = {
    enabled = true
    topic   = "test"
    custom_values = {
      cpu = {
        statistic = "avg"
        threshold = "90"
        period    = "300"
      }
      memory = {
        period    = 60
        statistic = "count"
        threshold = 100
      }
      connecions = {
        period    = 60
        statistic = "count"
        threshold = 100
      }
    }
  }
}
