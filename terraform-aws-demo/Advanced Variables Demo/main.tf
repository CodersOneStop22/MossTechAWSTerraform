provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = var.ami_map["us-west-2"]
  instance_type = var.allowed_instance_types[0] #Selecting the first instance type

  tags = {
    Name        = "${var.environment}-instance-${count.index + 1}"
    Environment = var.environment
  }
}
#Use a different key pair for production
resource "aws_key_pair" "key" {
  count      = var.environment == "production" ? 1 : 0
  key_name   = "production-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

}
