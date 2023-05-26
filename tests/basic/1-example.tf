module "this" {
  source = "../../"

  name               = "test-redis"
  vpc_id             = module.vpc.id
  subnets_ids        = module.vpc.private_subnets
  availability_zones = module.vpc.availability_zones
}
