# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "__TF_VAR_aws_provider_version__"
#     }
#     github = {
#       source  = "integrations/github"
#       version = "__TF_VAR_github_provider_version__"
#     }
#   }
# }

# provider "github" {}

# terraform {
#   backend "s3" {
#     bucket = "__TF_VAR_tf_state_s3_bucket__"
#     key    = "platform/__TF_VAR_cloud_env__/__TF_VAR_module__"
#     region = "__TF_VAR_default_region__"
#     assume_role = {
#       role_arn = "__TF_VAR_tf_state_iam_role_arn__"
#     }
#   }
# }

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}