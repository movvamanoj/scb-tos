module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "ec2" {
  source         = "./modules/ec2"
  subnet_id      = module.vpc.subnet_id
  instance_count = var.instance_count
  instance_type  = var.instance_type
}

module "s3_bucket" {
  source     = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "lambda_function" {
  source         = "./modules/lambda_function"
  function_name  = var.function_name
  function_code  = var.function_code
}

module "cloudwatch_event_rule" {
  source      = "./modules/cloudwatch_event_rule"
  rule_name   = var.rule_name
}
module "rollback_plan" {
  source            = "./modules/rollback_plan"
  rule_name         = module.cloudwatch_event_rule.rule_name
}
