provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "S3Demo" {
  bucket = "my-aug17-test-bucket"

  tags = {
    Name        = var.aws_tags[1]
    Environment = var.aws_tags[0]
  }
}
