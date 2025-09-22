resource "aws_vpc" "my_vpc1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc1.id
  tags = { 
    Name = "my-igw-vpc1"
  }
}

# Public subnet
resource "aws_subnet" "pub_sub" {
  vpc_id                  = aws_vpc.my_vpc1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "public-subnet-vpc1"
  }
}

# Public route table
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.my_vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table-vpc1"
  }
}

resource "aws_route_table_association" "pub_assoc" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.pub_rt.id
}

# Private subnet
resource "aws_subnet" "priv_sub" {
  vpc_id                  = aws_vpc.my_vpc1.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "private-subnet-vpc1"
  }
}

# Private route table
resource "aws_route_table" "priv_rt" {
  vpc_id = aws_vpc.my_vpc1.id
  tags = {
    Name = "private-route-table-my-vpc1"
  }
}

resource "aws_route_table_association" "priv_assoc" {
  subnet_id      = aws_subnet.priv_sub.id
  route_table_id = aws_route_table.priv_rt.id
}

# S3 VPC Endpoint (gateway type)
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.my_vpc1.id
  service_name      = "com.amazonaws.ap-south-1.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.priv_rt.id]

  tags = {
    Name = "s3-endpoint"
  }
}
