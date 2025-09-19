resource "aws_instance" "my-ec2-ins" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = var.key_name

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    provisioner "file" {
        source = var.source_path
        destination = var.destinantion_path
    }

    connection {
        type = "ssh"
        user = var.user_name
        private_key = fiel(var.private_key)
        host = self.public_id
    }
}