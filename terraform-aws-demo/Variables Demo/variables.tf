
	variable "region" {
  	description = "The AWS region where resources will be created"
  	default 	= "us-east-1"
	}

	variable "instance_type" {
  	description = "The type of instance to use for the EC2 instance"
  	default 	= "t2.micro"
	}

	variable "instance_name" {
  	description = "The name of the EC2 instance"
  	type    	= string
  	default 	= "MyTerraformInstance"
	}
