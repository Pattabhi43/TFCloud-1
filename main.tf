provider "aws" {
  region = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = ["10.0.0.0/16"]
  subnet_cidr = ["10.0.0.0/24"]
  pvt_cidr    = ["10.0.1.0/24"]
}

module "sg" {
  source   = "./modules/sg"
  sg-name  = "sg-01"
  port     = 80
  protocol = "HTTP"
  in_cidr  = ["0.0.0.0/0"]
}

module "alb" {
  source      = "./modules/alb"
  lb-name     = "lb-01"
  lb_port     = 80
  lb_protocol = "HTTP"
  lb_type     = "application"
  subnets     = "pub-01"
  del_protect = false
  tgt-Name    = "tgt-01"
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = "t2.micro"
}

