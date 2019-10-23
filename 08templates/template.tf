resource "aws_instance" "web" {
  count = 2
  ami           = "ami-00c4b877294e28e09"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0b60b597fc467671d","sg-06e97f31248fda0ad"]
  iam_instance_profile  = "EC2-RO-ROLE"
  key_name              = "devops"

}

resource "local_file" "local" {
content = <<EOT
[DEV]
%{ for ip in aws_instance.web.*.public_ip ~}
${ip}
%{ endfor ~}
[DEV:vars]
ansible_user=root
ansible_password=DevOps321
EOT
filename = "/tmp/abc"

}