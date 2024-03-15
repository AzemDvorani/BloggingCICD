terraform {
  backend "s3" {

    bucket = "azemii"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {

  source = "./modules/ec2"

  public_subnet_1a_id = module.vpc.public_subnet_1a_id
  public_subnet_1b_id = module.vpc.public_subnet_1b_id
  vpc_id              = module.vpc.vpc_id
  security_group_ids  = module.vpc.security_group_ids

  # ec2_security_group = module.vpc.ec2_security_group
  # # bastion_security_group = module.vpc.bastion_security_group

}

module "rds" {

  source               = "./modules/rds"
  private_subnet_1a_id = module.vpc.private_subnet_1a_id
  private_subnet_1b_id = module.vpc.private_subnet_1b_id
  security_group_ids   = module.vpc.security_group_ids
}
module "s3" {

  source = "./modules/s3"
}

module "efs" {
  source = "./modules/efs"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}
