terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.3" # TODO: The underlying module we use is not compatible with aws provider version >=5.0.0, please check and fix/change this requirement after then they will fix this
    }
  }
}
