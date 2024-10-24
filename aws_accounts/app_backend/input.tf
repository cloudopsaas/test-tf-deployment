########################################################################################################################
# General input variables
########################################################################################################################
variable "cloud_env" {
  type = string
  description = "Value representing the Landing Zone environment."
}
variable "global_config" {
  description = "Global config information provided by user input"
}
variable "module_config" {
  description = "Config information provided by user input"
}
########################################################################################################################
# Variables from other accounts
########################################################################################################################


########################################################################################################################
# Local values computed during runtime
########################################################################################################################
locals {
  account_name = basename(abspath(path.module))
  account_id = var.global_config.org_structure[var.cloud_env].accounts[local.account_name].id
  account_config = var.module_config[var.cloud_env].accounts[local.account_name]
}