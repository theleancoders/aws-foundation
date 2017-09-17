variable "name_prefix" {}
variable "environment" {}
variable "region" {}
variable "vpc_cidr_block" {}


provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "${var.name_prefix}-${var.environment}"
    Environment = "${var.environment}"
  }
}

output "aws_vpc_id" {
  value = "${aws_vpc.main.id}"
}

