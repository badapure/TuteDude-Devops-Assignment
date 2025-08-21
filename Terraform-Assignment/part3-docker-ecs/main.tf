provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"
}

module "ecr" {
  source = "./ecr"
}

module "ecs" {
  source = "./ecs"
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnets
  flask_image_url    = module.ecr.flask_image_url
  express_image_url  = module.ecr.express_image_url
}

module "alb" {
  source           = "./alb"
  vpc_id           = module.vpc.vpc_id
  public_subnets   = module.vpc.public_subnets
  flask_target     = module.ecs.flask_target_group_arn
  express_target   = module.ecs.express_target_group_arn
}
