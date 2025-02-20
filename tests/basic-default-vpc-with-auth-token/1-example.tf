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
  auth_token                 = "xxxxxxxxxxxxxxxx" # NOTE: it is required to have tls enabled(transit_encryption_enabled=true) in order to get this worked, also when we set this on existing cluster there is need to have ssl enabled already in place(so you at first need to set transit_encryption_enabled=true and apply and then after set auth_token)
  transit_encryption_enabled = true               # enable TLS to get auth_token set work
  # transit_encryption_mode = "required"          # NOTE: this option needs to be set when we migrate existing cluster from non-tls to tls, in case of if we also need to set auth_token then the value of this option should be set "required"

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
