variable "vpc_id" {
  default = "vpc-4271752b"
}

variable "cidr_list" {
  type = "list"
  default = ["0.0.0.0/0", "1.1.1.1/32", "2.2.2.2/32"]
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr_list
  }
}

resource "aws_security_group" "allow_https" {
  count       = length(var.cidr_list)
  name        = "allow_https_sg-${count.index}"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [element(var.cidr_list, count.index)]
  }
}

