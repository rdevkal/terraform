resource "aws_instance" "web" {
  ami           = "ami-00c4b877294e28e09"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0b60b597fc467671d","sg-06e97f31248fda0ad"]
  iam_instance_profile  = "EC2-RO-ROLE"
  key_name              = "devops"
}

output "PUBLIC_IP" {
  value = aws_instance.web.public_ip
}

output "PRIVATE_IP" {
  value = aws_instance.web.private_ip
}