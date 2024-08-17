#A list of instance types to choose from
variable "allowed_instance_types" {
  type        = list(string)
  description = "Allowed EC2 instance types"
  default     = ["t2.micro", "t3.micro", "t3.small"]
}
#Map for AMIs based on region
variable "ami_map" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0c55b159cbfafe1f0"
    "us-west-2" = "ami-07ad29071ea49df02"
  }
}
#A conditional variable for environment
variable "environment" {
  description = "Environment to deploy to"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "Environment must be one of 'dev', 'staging', or 'production'."
  }
}
#Variable for instance count, validated against production environment
variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
  validation {
    condition     = var.environment != "production" || var.instance_count <= 2
    error_message = "You can only deploy up to 2 instances in production."
  }
}
variable "region" {
  description = "region description"
  default     = "us-west-1"
}



