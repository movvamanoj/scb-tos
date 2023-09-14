terraform {
  backend "s3" {
    bucket = "terraform-state-lock-backend"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
