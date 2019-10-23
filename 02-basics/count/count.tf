resource "aws_instance" "web" {
  count  = 2
  ami           = "ami-00c03f7f7f2ec15c3"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0b60b597fc467671d","sg-02fe12cdeddffd429"]
  iam_instance_profile  = "EC2-RO-ROLE"
  key_name              = "devops"

  tags = {
    Name = "count-${count.index+1}"
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes = [tags]
  }
}
