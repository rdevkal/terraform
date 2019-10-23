variable "tags" {
  type = "map"
  default = {
      "env" = "PROD"
      "PROJ" = "STUDENT"
  }
}

variable "TAGS" {
  default = "map"
}

variable "COUNT" {}

locals {
  NAME = upper(lookup(var.TAGS, "PROJECT", "SAMPLE"))
}

resource "aws_instance" "prod-server" {
  count         = var.COUNT 
  ami           = "ami-00c4b877294e28e09"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0b60b597fc467671d","sg-06e97f31248fda0ad"]

  tags = {
    Name = "${local.NAME}-APP-SERVER"
    ENV  = lookup(var.TAGS, "env", "DEV")
  }
}