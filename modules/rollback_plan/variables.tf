
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "data-lake-hub-bucket"
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "lambda_function"
}

variable "rule_name" {
  description = "Name of the CloudWatch Event rule"
  type        = string
  default     = "myrules"
}
