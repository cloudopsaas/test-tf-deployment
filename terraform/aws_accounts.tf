provider "aws" {
  alias = "app_backend"
  region = local.global_config.env_variables.default_region
  assume_role {
    role_arn = "arn:aws:iam::${local.app_backend_account_id}:role/${local.global_config.naming_prefix}${local.global_config.deployer_role}"
  }
  default_tags {
    tags = local.global_config.resource_tags
  }
}
module "app_backend" {
    source = "../aws_accounts/app_backend"
    providers = {
        aws = aws.app_backend
    }

    cloud_env     = var.cloud_env
    global_config = local.global_config
    module_config = local.module_config
}


provider "aws" {
  alias = "operations"
  region = local.global_config.env_variables.default_region
  assume_role {
    role_arn = "arn:aws:iam::${local.operations_account_id}:role/${local.global_config.naming_prefix}${local.global_config.deployer_role}"
  }
  default_tags {
    tags = local.global_config.resource_tags
  }
}
module "operations" {
    source = "../aws_accounts/operations"
    providers = {
        aws = aws.operations
    }

    cloud_env     = var.cloud_env
    global_config = local.global_config
    module_config = local.module_config
}
