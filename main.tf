#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    # access_key = "${var.aws_access_key}"
    # secret_key = "${var.aws_secret_key}"
    region = "us-east-1"
}

resource "aws_vpc" "default" {
    cidr_block = "10.80.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "Terraform-Git-1"
	Owner = "Suresh "
	environment = "Dev"
	costcenter = 8080
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
	tags = {
        Name = "Terraform-Git-IGW"
    }
}

terraform {
  backend "s3" {
    bucket = "terraform-git-s3-backend"
    key    = "terraform-s3-backend.tfstate"
    region = "us-east-1"
  }
}
