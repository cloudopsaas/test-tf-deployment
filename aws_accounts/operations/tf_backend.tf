terraform {
  backend "s3" {
    bucket = "{{ TF_VAR_tf_state_s3_bucket }}"
    key    = "platform/{{ TF_VAR_cloud_env }}/{{ account_name }}/{{ TF_VAR_module }}"
    region = "{{ TF_VAR_default_region }}"
    assume_role = {
      role_arn = "{{ TF_VAR_tf_state_iam_role_arn }}"
    }
  }
}