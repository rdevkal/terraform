resource "aws_security_group" "allow_tls" {
  name        = "allow"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.all.id

  dynamic "ingress" {
    iterator    = objects
    for_each    = var.cidrs
    content { 
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["${objects.value}"]
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "all" {
  default = true
}

variable "cidrs" {
  default = ["1.1.1.1/32", "2.2.2.2/32"]
}