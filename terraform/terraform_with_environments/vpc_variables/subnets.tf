provider "aws" {
  region  = "us-west-2"
  profile = "cloudavail"
}



resource "aws_subnet" "az" {
  vpc_id            = "aws_vpc.joey.id"
  count             = "${var.az_count}"
  cidr_block        = "${lookup(var.public_subnet_cidrs, format("zone%d", count.index))}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
}

