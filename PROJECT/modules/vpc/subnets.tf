resource "aws_subnet" "private-subnets" {
  count         = length(data.aws_availability_zones.available.names)
  vpc_id        = aws_vpc.main.id
  cidr_block    = cidrsubnet(var.VPC_CIDR, 8, count.index)

  tags          = {
    Name        = "${local.PROJECT}-${local.ENV}-PRIVATE-SUBNET-${count.index+1}"
    ENV         = local.ENV 
    PROJECT     = local.PROJECT
  }

}

resource "aws_subnet" "public-subnets" {
  count         = length(data.aws_availability_zones.available.names)
  vpc_id        = aws_vpc.main.id
  cidr_block    = cidrsubnet(var.VPC_CIDR, 8, count.index+length(data.aws_availability_zones.available.names))

  tags          = {
    Name        = "${local.PROJECT}-${local.ENV}-PUBLIC-SUBNET-${count.index+1}"
    ENV         = local.ENV 
    PROJECT     = local.PROJECT
  }

}