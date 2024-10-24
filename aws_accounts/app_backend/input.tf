variable "cloud_env" {
  type = string
  description = "Value representing the Landing Zone environment. Will be set by the pipeline as TF_VAR_cloud_env based on the repo branch."
}

########################################################################################################################
# Variables loaded from JSON file
########################################################################################################################

locals {
  global_config = jsondecode(file("${path.root}/../../config/global_config.json"))
  module_config = jsondecode(file("${path.root}/../../config/module_config.json"))
  account_name = basename(abspath(path.root))
  account_id = local.global_config.org_structure[var.cloud_env].accounts[local.account_name].id
  account_config = local.module_config[var.cloud_env].accounts[local.account_name]
}