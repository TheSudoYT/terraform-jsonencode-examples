// Get the tags from ssm parameter store
data "aws_ssm_parameter" "tags" {
  name = "/my-app/config/tags"
}

// Decode the json strings from ssm parameter store
locals {
  tags_json = jsondecode(data.aws_ssm_parameter.tags.value)
}

// Create a map of key value tags to be used as tags
locals {
  tags_map = {
    for key, value in local.tags_json : key => tostring(value)
  }
}

resource "aws_kms_key" "the_key" {
  description             = "KMS key with tags taken from SSM"
  deletion_window_in_days = 7
  tags = local.tags_map
}