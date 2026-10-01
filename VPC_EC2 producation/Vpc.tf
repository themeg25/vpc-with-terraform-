############################################
# VPC
############################################

resource "aws_vpc" "madhan_vpc" {

  cidr_block           = "101.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

############################################
# Internet Gateway
############################################

resource "aws_internet_gateway" "madhan_igw" {

  vpc_id = aws_vpc.madhan_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

############################################
# Public Subnet 1
############################################

resource "aws_subnet" "madhan_public_subnet_1" {

  vpc_id                  = aws_vpc.madhan_vpc.id
  cidr_block              = "101.0.1.0/24"
  availability_zone       = "ap-south-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-1"
  }
}

############################################
# Public Subnet 2
############################################

resource "aws_subnet" "madhan_public_subnet_2" {

  vpc_id                  = aws_vpc.madhan_vpc.id
  cidr_block              = "101.0.2.0/24"
  availability_zone       = "ap-south-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-2"
  }
}

############################################
# Private Subnet 1
############################################

resource "aws_subnet" "madhan_private_subnet_1" {

  vpc_id            = aws_vpc.madhan_vpc.id
  cidr_block        = "101.0.3.0/24"
  availability_zone = "ap-south-2a"

  tags = {
    Name = "${var.project_name}-private-subnet-1"
  }
}

############################################
# Private Subnet 2
############################################

resource "aws_subnet" "madhan_private_subnet_2" {

  vpc_id            = aws_vpc.madhan_vpc.id
  cidr_block        = "101.0.4.0/24"
  availability_zone = "ap-south-2b"

  tags = {
    Name = "${var.project_name}-private-subnet-2"
  }
}

############################################
# Public Route Table
############################################

resource "aws_route_table" "madhan_public_rt" {

  vpc_id = aws_vpc.madhan_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.madhan_igw.id
  }

  tags = {
    Name = "${var.project_name}-public-route-table"
  }
}

############################################
# Private Route Table
############################################

resource "aws_route_table" "madhan_private_rt" {

  vpc_id = aws_vpc.madhan_vpc.id

  tags = {
    Name = "${var.project_name}-private-route-table"
  }
}

############################################
# Public Route Table Association
############################################

resource "aws_route_table_association" "madhan_public_association_1" {

  subnet_id      = aws_subnet.madhan_public_subnet_1.id
  route_table_id = aws_route_table.madhan_public_rt.id
}

resource "aws_route_table_association" "madhan_public_association_2" {

  subnet_id      = aws_subnet.madhan_public_subnet_2.id
  route_table_id = aws_route_table.madhan_public_rt.id
}

############################################
# Private Route Table Association
############################################

resource "aws_route_table_association" "madhan_private_association_1" {

  subnet_id      = aws_subnet.madhan_private_subnet_1.id
  route_table_id = aws_route_table.madhan_private_rt.id
}

resource "aws_route_table_association" "madhan_private_association_2" {

  subnet_id      = aws_subnet.madhan_private_subnet_2.id
  route_table_id = aws_route_table.madhan_private_rt.id
}