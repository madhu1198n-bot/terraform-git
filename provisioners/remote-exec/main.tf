resource "aws_security_group" "allow_ssh" {
    name = "terraform-sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my-ec2" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    connection {
        type = "ssh"
        user = var.username
        private_key = file(var.private_key)
        host = self.public_ip
    }

    provisioner "remote-exec" {
        inline = var.commands
    }
}
