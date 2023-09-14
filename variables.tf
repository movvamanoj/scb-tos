variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}


variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "data-lake-hub-bucket"
}

variable "bucket_policy" {
  type    = string
  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::data-lake-hub-bucket"
    }
  ]
}
EOF
}


variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "lambda_function"
}

variable "function_code" {
  description = "Path to the Lambda function code"
  type        = string
  default     = "lambda_function_code"
}

variable "rule_name" {
  description = "Name of the CloudWatch Event rule"
  type        = string
  default     = "myrules"
}
