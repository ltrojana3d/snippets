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

resource "aws_subnet" "public_2a" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "public_2a"
  }
}

resource "aws_subnet" "public_2b" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.1.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "public_2b"
  }
}

resource "aws_subnet" "public_2c" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.2.0/24"
  availability_zone = "us-west-2c"

  tags = {
    Name = "public_2c"
  }
}

resource "aws_subnet" "public_2d" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "10.30.3.0/24"
  availability_zone = "us-west-2d"

  tags = {
    Name = "public_2d"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.joey.id}"

  tags = {
    Name = "joey"
  }
}

resource "aws_route_table" "rt01" {
  vpc_id = "${aws_vpc.joey.id}"

  route {
    cidr_block = "10.0.0.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  route {
    cidr_block = "10.0.3.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "01" {
  subnet_id      = "${aws_subnet.public_2a.id}"
  route_table_id = "${aws_route_table.rt01.id}"
}

resource "aws_route_table_association" "02" {
  subnet_id      = "${aws_subnet.public_2b.id}"
  route_table_id = "${aws_route_table.rt01.id}"
}

resource "aws_route_table_association" "03" {
  subnet_id      = "${aws_subnet.public_2c.id}"
  route_table_id = "${aws_route_table.rt01.id}"
}

resource "aws_route_table_association" "04" {
  subnet_id      = "${aws_subnet.public_2d.id}"
  route_table_id = "${aws_route_table.rt01.id}"
}
