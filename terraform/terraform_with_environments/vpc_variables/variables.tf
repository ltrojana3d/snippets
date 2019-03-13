variable "vpc_cidr_block" {
  description = "cidr block of vpc"
  default     = "10.30.0.0/16"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  default     = "[]"
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  default     = "[]"
}

variable "publicsubnet01_cidr" {
  default = "10.30.0.0/24"
}

variable "publicsubnet02_cidr" {
  default = "10.30.1.0/24"
}

variable "publicsubnet03_cidr" {
  default = "10.30.2.0/24"
}

variable "publicsubnet04_cidr" {
  default = "10.30.3.0/24"
}

variable "privatesubnet01_cidr" {
  default = "10.30.12.0/24"
}

variable "privatesubnet02_cidr" {
  default = "10.30.13.0/24"
}

variable "privatesubnet03_cidr" {
  default = "10.30.14.0/24"
}

variable "privatesubnet04_cidr" {
  default = "10.30.15.0/24"
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "availability_zones" {
  description = "list of availability zones"
  type        = "string"
  default     = "us-west-2a,us-west-2b,us-west-2c,us-west-2d"
}

variable "az_count" {
  description = "number of azs in us-west-2"
  default     = "4"
}

variable "public_subnet_cidrs" {
  description = "cidrs for public subnets"

  default = {
    zone0 = "10.30.0.0/24"
    zone1 = "10.30.1.0/24"
    zone2 = "10.30.2.0/24"
    zone3 = "10.30.3.0/24"
  }
}

variable "nat_subnet_cidrs" {
  description = "cidrs for nat subnets"

  default = {
    zone0 = ".4.0/25"
    zone1 = ".6.0/25"
    zone2 = ".8.0/25"
    zone3 = ".10.0/25"
  }
}

variable "private_subnet_cidrs" {
  description = "cidrs for private subnets"

  default = {
    zone0 = ".12.0/24"
    zone1 = ".13.0/24"
    zone2 = ".14.0/24"
    zone3 = ".15.0/24"
  }
}
