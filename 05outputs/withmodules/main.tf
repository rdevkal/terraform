module "VPC" {
  source    = "./modules/VPC"
}

module "EC2" {
  source    = "./modules/EC2"
  VPC_ID    = module.VPC.VPC_ID
}

