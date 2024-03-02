resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.proj_name}-vpc"
  }
}

resource "aws_subnet" "pub-sub-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.sub_a_cidr
  availability_zone       = var.sub_a_az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.proj_name}-pub-sub-a"
  }
}

resource "aws_subnet" "pub-sub-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.sub_b_cidr
  availability_zone       = var.sub_b_az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.proj_name}-pub-sub-b"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.proj_name}-igw"
  }
}

resource "aws_route_table" "rtbl" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.proj_name}-rtbl"
  }
}

resource "aws_route" "dflt_route" {
  route_table_id         = aws_route_table.rtbl.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "rtb_asc_a" {
  subnet_id      = aws_subnet.pub-sub-a.id
  route_table_id = aws_route_table.rtbl.id
}

resource "aws_route_table_association" "rtb_asc_b" {
  subnet_id      = aws_subnet.pub-sub-b.id
  route_table_id = aws_route_table.rtbl.id
}