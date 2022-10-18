resource "aws_vpc" "vpc-main" {
  cidr_block = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  tags = {
    Name = "first-vpc"
  }
}
resource "aws_egress_only_internet_gateway" "e-igw" {
    vpc_id = aws_vpc.vpc-main.id
    tags = {
        "Name" = "egress_only_internet_gateway"
    }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "subnet-1"
  }
}
resource "aws_internet_gateway" "i-gw" {
  vpc_id = aws_vpc.vpc-main.id
  tags = {
    Name = "i-gateway-1"
  }
}
resource "aws_route_table" "r-table" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.i-gw.id
  }
  route{
    ipv6_cidr_block = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.e-igw.id
  }
  tags = {
    "Name" = "route-table1"
  }
}