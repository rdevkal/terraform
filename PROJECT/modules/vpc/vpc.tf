resource "aws_vpc" "main" {
  cidr_block  = "${var.VPC_CIDR}"
  tags        = {
    Name      = "${local.PROJECT}-${local.ENV}-VPC"
    ENV       = local.ENV 
    PROJECT   = local.PROJECT
  }
}

