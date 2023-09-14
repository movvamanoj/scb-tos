resource "aws_instance" "main" {
  count         = var.instance_count
  ami           = "ami-0fb2f0b847d44d4f0"  # Replace with your desired AMI ID
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "EC2-${count.index}"
  }
}