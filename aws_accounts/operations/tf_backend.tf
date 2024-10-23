terraform {
  backend "s3" {
    bucket = "{{ TF_STATE_S3_BUCKET }}"
    key    = "platform/{{ ENVIRONMENT }}/{{ ACCOUNT_NAME }}/{{ MODULE }}"
    assume_role = {
      role_arn = "{{ TF_STATE_IAM_ROLE_ARN }}"
    }
  }
}