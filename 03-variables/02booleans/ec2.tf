variable "isprod" {
  default = true
}

variable "isstage" {
  default = false
}

resource "aws_instance" "prod-server" {
  count         = var.isprod == true ? 1 : 0
  ami           = "ami-00c4b877294e28e09"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0b60b597fc467671d","sg-06e97f31248fda0ad"]

  tags = {
    Name = "prod"
  }
}

resource "aws_instance" "stage-server" {
  count         = var.isstage == true ? 1 : 0
  ami           = "ami-00c4b877294e28e09"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0b60b597fc467671d","sg-06e97f31248fda0ad"]

  tags = {
    Name = "stage"
  }
}

