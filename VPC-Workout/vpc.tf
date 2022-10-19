resource "aws_vpc" "vpc-main" {
  cidr_block = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  tags = {
    Name = "second-vpc"
  }
}
resource "aws_internet_gateway" "i-gw" {
  vpc_id = aws_vpc.vpc-main.id
  tags = {
    Name = "i-gateway-2"
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
    gateway_id = aws_internet_gateway.i-gw.id
  }
  tags = {
    "Name" = "route-table1"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "subnet-1"
  }
}
resource "aws_route_table_association" "a-sub" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.r-table.id
}