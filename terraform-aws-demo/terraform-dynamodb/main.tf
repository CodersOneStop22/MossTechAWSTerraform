provider "aws" {
  region = var.region
}


resource "aws_dynamodb_table" "table_demo" {
  name         = "example-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = var.aws_tags[1]
    Environment = var.aws_tags[0]
  }
}
