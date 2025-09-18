output "private_ip" {
    description = "private_ip of my isntance"
    value = aws_instance.my_instance.private_ip
}