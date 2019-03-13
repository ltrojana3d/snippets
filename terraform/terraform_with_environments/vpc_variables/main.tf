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

resource "aws_eip" "nat" {
  vpc = "true"
}

resource "aws_subnet" "Public01" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

    tags = {
    Name = "PublicSubnet01"
  }
}

resource "aws_subnet" "Public02" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

    tags = {
    Name = "PublicSubnet02"
  }
}

resource "aws_subnet" "Public03" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

    tags = {
    Name = "PublicSubnet03"
  }
}

resource "aws_subnet" "Public04" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.public_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

    tags = {
    Name = "PublicSubnet04"
  }
}

resource "aws_subnet" "Private01" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

    tags = {
    Name = "PrivateSubnet01"
  }
}

resource "aws_subnet" "Private02" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

    tags = {
    Name = "PrivateSubnet02"
  }
}

resource "aws_subnet" "Private03" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

    tags = {
    Name = "PrivateSubnet03"
  }
}

resource "aws_subnet" "Private04" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.private_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

    tags = {
    Name = "PrivateSubnet04"
  }
}

resource "aws_subnet" "NAT01" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 0)}"
  availability_zone = "${element(var.availability_zones, 0)}"

    tags = {
    Name = "NATSubnet01"
  }
}

resource "aws_subnet" "NAT02" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 1)}"
  availability_zone = "${element(var.availability_zones, 1)}"

    tags = {
    Name = "NATSubnet02"
  }
}

resource "aws_subnet" "NAT03" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 2)}"
  availability_zone = "${element(var.availability_zones, 2)}"

    tags = {
    Name = "NATSubnet03"
  }
}

resource "aws_subnet" "NAT04" {
  vpc_id            = "${aws_vpc.joey.id}"
  cidr_block        = "${element(var.nat_subnet_cidr, 3)}"
  availability_zone = "${element(var.availability_zones, 3)}"

    tags = {
    Name = "NATSubnet04"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.joey.id}"

  tags = {
    Name = "joey"
  }
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.Public01.id}"

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "PublicRoute" {
  vpc_id = "${aws_vpc.joey.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

    tags = {
    Name = "PublicRoute"
  }
}

resource "aws_route_table" "PrivateRoute" {
  vpc_id = "${aws_vpc.joey.id}"

    tags = {
    Name = "PrivateRoute"
  }
}

resource "aws_route_table" "NATRoute" {
  vpc_id = "${aws_vpc.joey.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATgw.id}"
  }

    tags = {
    Name = "NATRoute"
  }
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
resource "aws_route_table_association" "NAT01" {
  subnet_id      = "${aws_subnet.NAT01.id}"
  route_table_id = "${aws_route_table.NATRoute.id}"
}

resource "aws_route_table_association" "NAT02" {
  subnet_id      = "${aws_subnet.NAT02.id}"
  route_table_id = "${aws_route_table.NATRoute.id}"
}

resource "aws_route_table_association" "NAT03" {
  subnet_id      = "${aws_subnet.NAT03.id}"
  route_table_id = "${aws_route_table.NATRoute.id}"
}

resource "aws_route_table_association" "NAT04" {
  subnet_id      = "${aws_subnet.NAT04.id}"
  route_table_id = "${aws_route_table.NATRoute.id}"
}
