provider "aws" {
  region  = "us-west-2"
  profile = "cloudavail"
}

resource "aws_vpc" "joey" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "joey"
  }
}

resource "aws_subnet" "Public01" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.publicsubnet01_cidr}"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "Public02" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.publicsubnet02_cidr}"
  availability_zone = "us-west-2b"
}

resource "aws_subnet" "Public03" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.publicsubnet03_cidr}"
  availability_zone = "us-west-2c"
}

resource "aws_subnet" "Public04" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.publicsubnet04_cidr}"
  availability_zone = "us-west-2d"
}

resource "aws_subnet" "Private01" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.privatesubnet01_cidr}"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "Private02" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.privatesubnet02_cidr}"
  availability_zone = "us-west-2b"
}

resource "aws_subnet" "Private03" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.privatesubnet03_cidr}"
  availability_zone = "us-west-2c"
}

resource "aws_subnet" "Private04" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${var.privatesubnet04_cidr}"
  availability_zone = "us-west-2d"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.joey.id}"

  tags = {
    Name = "joey"
  }
}

resource "aws_route_table" "PublicRoute" {
  vpc_id = "${aws_vpc.joey.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table" "PrivateRoute" {
  vpc_id = "${aws_vpc.joey.id}"
}

resource "aws_route_table_association" "Public01" {
  subnet_id      = "${aws_subnet.Public01.id}"
  route_table_id = "${aws_route_table.PublicRoute.id}"
}

resource "aws_route_table_association" "Public02" {
  subnet_id      = "${aws_subnet.Public02.id}"
  route_table_id = "${aws_route_table.PublicRoute.id}"
}

resource "aws_route_table_association" "Public03" {
  subnet_id      = "${aws_subnet.Public03.id}"
  route_table_id = "${aws_route_table.PublicRoute.id}"
}

resource "aws_route_table_association" "Public04" {
  subnet_id      = "${aws_subnet.Public04.id}"
  route_table_id = "${aws_route_table.PublicRoute.id}"
}

resource "aws_route_table_association" "Private01" {
  subnet_id      = "${aws_subnet.Private01.id}"
  route_table_id = "${aws_route_table.PrivateRoute.id}"
}

resource "aws_route_table_association" "Private02" {
  subnet_id      = "${aws_subnet.Private02.id}"
  route_table_id = "${aws_route_table.PrivateRoute.id}"
}

resource "aws_route_table_association" "Private03" {
  subnet_id      = "${aws_subnet.Private03.id}"
  route_table_id = "${aws_route_table.PrivateRoute.id}"
}

resource "aws_route_table_association" "Private04" {
  subnet_id      = "${aws_subnet.Private04.id}"
  route_table_id = "${aws_route_table.PrivateRoute.id}"
}
