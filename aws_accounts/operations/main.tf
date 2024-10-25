########################################################################################################################
# VPC creation
########################################################################################################################
resource "aws_vpc" "this" {
    cidr_block = local.account_config.vpc_name
    tags = {
        Name = "${var.global_config.naming_prefix}${local.account_config.vpc_name}"
    }
}