########################################################################################################################
# Variables loaded from JSON file
########################################################################################################################

locals {
  global_config = jsondecode(file("${path.root}/../../config/global_config.json"))
  module_config = jsondecode(file("${path.root}/../../config/module_config.json"))
  environment = local.module_config.env_variables.environment
  account_name = basename(abspath(path.root))
  account_id = local.global_config.org_structure[local.environment].accounts[local.account_name].id
  account_config = local.module_config.accounts[local.account_name]
}