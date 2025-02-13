module "this" {
  source = "../../"

  name                       = "test-basic-default-vpc-redis"
  family                     = "redis7"
  engine_version             = "7.1"
  vpc_id                     = data.aws_vpc.default.id
  subnet_ids                 = data.aws_subnets.default.ids
  cluster_size               = 1
  automatic_failover_enabled = false
  alarms                     = { enabled = false, topic = "", threshold = 1 }
  # allowed_security_group_ids = [
  #   "sg-xxxx"
  # ]
}
