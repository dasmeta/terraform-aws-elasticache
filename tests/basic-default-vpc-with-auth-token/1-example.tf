module "this" {
  source = "../../"

  name                       = "test-default-vpc-redis-auth"
  family                     = "redis7"
  engine_version             = "7.1"
  vpc_id                     = data.aws_vpc.default.id
  subnet_ids                 = data.aws_subnets.default.ids
  cluster_size               = 1
  automatic_failover_enabled = false

  # enable token based auth
  auth_token                 = "xxxxxxxxxxxxxxxx"
  transit_encryption_enabled = true

  # set to be accessible within vpc
  additional_security_group_rules = [{
    key         = "all-in-open-within-vpc"
    type        = "ingress"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.default.cidr_block]
    description = "Allow inbound traffic from vpc CIDR"
  }]

  alarms = { enabled = false, topic = "", threshold = 1 }
}
