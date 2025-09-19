resource "aws_instance" "my-in" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = var.key_name
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    provisioner "local-exec" {
        command = "echo ec2 is created ${self.public_ip}"
    }
}