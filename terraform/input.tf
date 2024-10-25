variable "cloud_env" {
  type = string
  description = "Value representing the Landing Zone environment. Will be set by the pipeline as TF_VAR_cloud_env based on the repo branch."
}

variable "default_region" {
  type = string
  description = "Value representing the default AWS region. Will be set by the pipeline as TF_VAR_default_region based on the repo branch."
}

########################################################################################################################
# Variables loaded from JSON file
########################################################################################################################

locals {
  global_config = jsondecode(file("${path.root}/../config/global_config.json"))
  module_config = jsondecode(file("${path.root}/../config/module_config.json"))
  app_backend_account_id = local.global_config.org_structure[var.cloud_env].accounts["app_backend"].id
  operations_account_id = local.global_config.org_structure[var.cloud_env].accounts["operations"].id
}