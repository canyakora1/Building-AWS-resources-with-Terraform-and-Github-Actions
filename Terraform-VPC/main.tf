module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr

  #zs
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  #enable_nat_gateway = true
  #enable_vpn_gateway = true

  #tags = {
  #terraform = "true"
  #Enviornment = "dev"
  #}

}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  security_group_id = module.sg.security_group_id
  public_subnet     = module.vpc.public_subnet_id
}

module "alb" {
  source            = "./modules/alb"
  security_group_id = module.sg.security_group_id
  public_subnet_id  = module.vpc.public_subnet_id
  vpc_id            = module.vpc.vpc_id
  instances         = module.ec2.instances
}



