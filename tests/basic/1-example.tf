module "this" {
  source = "../../"

  name               = "test-redis"
  vpc_id             = module.vpc.id
  subnet_ids         = module.vpc.private_subnets
  cluster_size       = 2
  maintenance_window = "sun:03:00-sun:04:00"
  alarms             = { enabled = true, topic = "test-topic", threshold = 1 }
}
