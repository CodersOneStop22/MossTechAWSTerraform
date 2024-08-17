variable "region" {
  description = "Region"
  default     = "us-west-2"
}


variable "aws_tags" {
  description = "tags"
  type        = list(string)
  default     = ["Dev", "My Test bucket", "S3Demo"]
}
