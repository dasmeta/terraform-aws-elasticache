module "this" {
  source = "../../"

  name               = "test-redis"
  vpc_id             = module.vpc.id
  subnet_ids         = module.vpc.private_subnets
  availability_zones = ["eu-central-1a", "eu-central-1b"]
  cluster_size       = 2
  multi_az_enabled   = true
  maintenance_window = "sun:03:00-sun:04:00"
  alarms             = { enabled = true, topic = "test-topic", threshold = 1 }
}
