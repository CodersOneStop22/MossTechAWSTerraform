
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
