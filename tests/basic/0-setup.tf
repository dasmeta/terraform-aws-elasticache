terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.41"
    }
  }

  required_version = ">= 1.3.0"
}

/**
 * set the following env vars so that aws provider will get authenticated before apply:

 export AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxxxxxxxxxxx
 export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxx
*/
provider "aws" {
  region = "eu-central-1"
}


module "vpc" {
  source  = "dasmeta/vpc/aws"
  version = "1.0.0"

  name = "elasticache-test"
  cidr = "10.26.0.0/16"

  availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets    = ["10.16.1.0/24", "10.16.2.0/24", "10.16.3.0/24"]
  public_subnets     = ["10.16.4.0/24", "10.16.5.0/24", "10.16.6.0/24"]
}
