variable "name_prefix" {
  default = "baa"
}

variable "environment" {
  default = "qa1"
}

variable "cidr_blocks" {
  type = "map"

  default = {
    us-east-1 = "10.0.0.0/16"
    eu-west-1 = "10.1.0.0/16"
  }
}

# doing this duplication of code because we terraform aws provider
# can't work with multiple regions at the same time

module "region-us-east-1" {
  source = "../../modules/region"

  name_prefix = "${var.name_prefix}"
  environment = "${var.environment}"
  vpc_cidr_block = "${lookup(var.cidr_blocks, "us-east-1")}"
  region = "us-east-1"
}

module "region-eu-west-1" {
  source = "../../modules/region"

  name_prefix = "${var.name_prefix}"
  environment = "${var.environment}"
  vpc_cidr_block = "${lookup(var.cidr_blocks, "eu-west-1")}"

  region = "eu-west-1"
}
