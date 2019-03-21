# s3 bucket should reflect region "east/west"
# s3 bucket key should reflect environment "dev/prod"
terraform {
  backend "s3" {
    bucket = "cloudavail-terraform-test-west"
    key    = "us-west-2/dev/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  profile = "cloudavail"
  region  = "${var.aws_region}"
}

module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr_block  = "${var.vpc_cidr_block}"
  aws_region      = "${var.aws_region}"
  environment     = "${var.environment}"
  private_subnets = "${var.private_subnets}"
  nat_subnets     = "${var.nat_subnets}"
  public_subnets  = "${var.public_subnets}"

  #  public_subnet_cidr  = ["10.40.0.0/24", "10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24"]
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}