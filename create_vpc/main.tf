resource "aws_vpc" "my-vpc1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "my-vpc1"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-vpc1.id
    tags = { 
        Name = "my-igw-vpc1"
    }
}

resource "aws_subnet" "pub-sub" {
    vpc_id = aws_vpc.my-vpc1.id
    cidr_block = "10.1.0.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
}

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.my-vpc1.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "public-route-table-vpc1"
    }
}

resource "aws_route_table_association" "rt-asso" {
    subnet_id = aws_subnet.pub-sub.id
    route_table_id = aws_route_table.pub-rt.id
}

resource "aws_subnet" "priv-sub" {
    vpc_id = aws_vpc.my-vpc1.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = false
    availability_zone = "ap-south-1a"
    tags = {
        Name = "private-subnet-vpc1"
    }
}

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.my-vpc1.id
    tags = {
        Name = "private-route-table-my-vpc1"
    }
}

resource "aws_route_table_association" "private-assoc" {
    subnet_id = aws_subnet.priv-sub.id
    route_table_id = aws_route_table.private-rt.id
}

