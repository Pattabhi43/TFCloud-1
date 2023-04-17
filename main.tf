terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.74.2"
      organization = "AWS_prk"
      hostname = "app.terraform.io"
    }
  }

  workspaces {
      name = "AWS-ws-1"
    }
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

