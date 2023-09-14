data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
}