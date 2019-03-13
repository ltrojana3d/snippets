

resource "aws_vpc" "joey" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "joey"
  }
}