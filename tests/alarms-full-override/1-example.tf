module "this" {
  source = "../../"

  name         = "test-redis"
  vpc_id       = "vpc-0ff9b673cfaeaa80a"
  subnet_ids   = ["subnet-019890a193d684e62", "subnet-0403d4f3c1ff3e6a4"]
  cluster_size = 2
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
