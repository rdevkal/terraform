module "VPC" {
  source        = "./modules/vpc"
  VPC_CIDR      = var.VPC_CIDR
  TAGS          = var.TAGS
}

module "EC2" {
  source        = "./modules/ec2"
  VPC_CIDR      = var.VPC_CIDR
  TAGS          = var.TAGS
}
