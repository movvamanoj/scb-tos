output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}
output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "function_arn" {
  value = module.lambda_function.function_arn
}

output "rule_name" {
  value = module.cloudwatch_event_rule.rule_name
}
