output "vpc_id" {
    description = "id of my vpc-1"
    value = aws_vpc.my_vpc1.id
}

output "public_subnet_id" {
    description = "id of my public-subnet"
    value = aws_subnet.pub_sub.id
}

output "private_subnet_id" {
    description = "id of my private-subnet"
    value = aws_subnet.priv_sub.id
}