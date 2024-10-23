terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = local.global_config.env_variables.default_region
  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/${local.global_config.naming_prefix}${local.global_config.deployer_role}"
  }
  default_tags {
    tags = local.global_config.resource_tags
  }
}