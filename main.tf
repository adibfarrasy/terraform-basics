terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "ap-southeast-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

locals {
    prefix = "terraform"
}

data "aws_vpc" "main" { # read-only infrastructure
    default = true
}

# resource "aws_vpc" "main" {
#     cidr_block = "10.0.0.0/16"

#     tags = {
#         Name = "${local.prefix}_vpc"
#     }
# }

# resource "aws_subnet" "web" {
#     vpc_id = aws_vpc.main.id
#     cidr_block = "10.0.0.0/24"

#     tags = {
#         Name = "${local.prefix}_subnet"
#     }
# }

resource "aws_instance" "adib_test" {
    ami = var.ubuntu_ami 
    instance_type = var.instance_type
    # subnet_id = aws_subnet.web.id

    tags = {
        Name = "${local.prefix}_test"
    }
}