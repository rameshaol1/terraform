#Create AWS VPC
resource "aws_vpc" "levelupvpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    "name" = "levelup_vpc"
  } 
}

#Create Public  Subnets in custom VPC
resource "aws_subnet" "levelupvpc-public-1" {
  vpc_id = "aws_vpc.levelupvpc.id"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2a"

  tags = {
    "name" = "levelupvpc-public-1"
  }
}

resource "aws_subnet" "levelupvpc-public-2" {
  vpc_id = "aws_vpc.levelupvpc.id"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2b"

  tags = {
    "name" = "levelupvpc-public-2"
  }
}

resource "aws_subnet" "levelupvpc-public-3" {
  vpc_id = "aws_vpc.levelupvpc.id"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2c"

  tags = {
    "name" = "levelupvpc-public-3"
  }
}

#Create Private subnets for custom VPC

resource "aws_subnet" "levelupvpc-private-1" {
  vpc_id = "aws_vpc.levelupvpc.id"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2a"

  tags = {
    "name" = "levelupvpc-private-1"
  }
}

resource "aws_subnet" "levelupvpc-private-2" {
  vpc_id = "aws_vpc.levelupvpc.id"
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2b"

  tags = {
    "name" = "levelupvpc-private-2"
  }
}

resource "aws_subnet" "levelupvpc-private-3" {
  vpc_id = "aws_vpc.levelupvpc.id"
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2c"

  tags = {
    "name" = "levelupvpc-private-3"
  }
}

#Custom Internet gateway

resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.levelupvpc.id

  tags = {
    "name" = "levelup-gw"
  }
}

#Route table for the custom VPC

resource "aws_route_table" "levelup-public" {
  vpc_id = aws_vpc.levelupvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-gw.id
  }
}

resource "aws_route_table_association" "levelup-public-1-a" {
  subnet_id = aws_subnet.levelupvpc-public-1.id
  route_table_id = aws_route_table.levelupvpc-public.id
}

resource "aws_route_table_association" "levelup-public-2-a" {
  subnet_id = aws_subnet.levelupvpc-public-2.id
  route_table_id = aws_route_table.levelupvpc-public.id
}

resource "aws_route_table_association" "levelup-public-3-a" {
  subnet_id = aws_subnet.levelupvpc-public-3.id
  route_table_id = aws_route_table.levelupvpc-public.id
}