#resource "aws_security_group" "allow_tls" {
#  name        = "allow_tls"
#  description = "Allow TLS inbound traffic"
#  vpc_id      = var.VPC_ID
#}


data "aws_vpc" "all" {
  default = true
}

#locals {
#  VPC_ID = join("",data.aws_vpcs.all.ids)
#}

output "all" {
  value = data.aws_vpc.all.id
}

output "path" {
  value = path.cwd
}