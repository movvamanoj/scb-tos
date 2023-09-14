resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "SampleVPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "SampleSubnet"
  }
}

