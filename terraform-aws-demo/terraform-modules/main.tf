provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block     = "10.0.0.0/16"
  vpc_name       = "my-vpc"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source = "./modules/ec2"

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = element(module.vpc.public_subnets_ids, 0)
  key_name      = "my-key"
  instance_name = "my-ec2-instance"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "my-aug23-bucket-name"
}
