provider "aws" {
  region  = "us-west-2"
  profile = "cloudavail"
}

resource "aws_vpc" "joey" {
  cidr_block = "10.30.0.0/16"

  tags = {
    Name = "joey"
  }
}

resource "aws_subnet" "public-2a" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "public-2a"
  }
}

resource "aws_subnet" "public-2b" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.1.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "public-2b"
  }
}

resource "aws_subnet" "public-2c" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.2.0/24"
  availability_zone = "us-west-2c"

  tags = {
    Name = "public-2c"
  }
}

resource "aws_subnet" "public-2d" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.3.0/24"
  availability_zone = "us-west-2d"

  tags = {
    Name = "public-2d"
  }
}
