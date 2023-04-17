resource "aws_vpc" "vpc-01" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "new-1"
    }
}

resource "aws_subnet" "pb-01" {
  cidr_block = var.subnet_cidr
  vpc_id = aws_vpc.vpc-01.id
  tags = {
    Name = "new-1"
  }
}

resource "aws_subnet" "pvt-01" {
  cidr_block = var.pvt_cidr
  vpc_id = aws_vpc.vpc-01.id
  tags = {
    Name = "new-1"
  }
}

resource "aws_internet_gateway" "gt-1" {
  vpc_id = aws_vpc.vpc-01.id
  tags = {
    Name = "new-1"
  }
}

resource "aws_nat_gateway" "nat-1" {
  subnet_id = aws_subnet.pvt-01.id
}

resource "aws_route_table" "pbrt-1" {
  vpc_id = aws_vpc.vpc-01.id
  route {
    cidr_block = var.pub_ip
    gateway_id = aws_internet_gateway.gt-1.id
  }
}

resource "aws_route_table" "pvtrt-1" {
  vpc_id = aws_vpc.vpc-01.id
}

resource "aws_route_table_association" "rts-1" {
  subnet_id = aws_subnet.pb-01.id
  route_table_id = aws_route_table.pbrt-1.id
}

resource "aws_route_table_association" "rtpvt-1" {
  subnet_id = aws_subnet.pvt-01.id
  route_table_id = aws_route_table.pvtrt-1.id
}

