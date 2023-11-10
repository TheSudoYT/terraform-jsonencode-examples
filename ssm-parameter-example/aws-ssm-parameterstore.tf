variable "tags" {
  type = map(string)

  default = {
    business_unit = "HR"
    environment   = "dev"
    owner         = "sanji"
    contact       = "sanji@grandline.com"
  }
}

resource "aws_ssm_parameter" "tags_parameter" {
  name  = "/my-app/config/tags"
  type  = "String"                  
  value = jsonencode(var.tags)
}