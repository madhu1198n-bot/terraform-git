resource "aws_security_group" "jenkins_sg" {
    name = "jenkins_sg"
    vpc_id = "replace_your_original_vpc_id"

    ingress {
        description = "ALLOW SSH CONNECTION"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "ALLOW CONNECTION TO JENKINS PORT"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     tags = {
        Name = "jenkins_sg"
     }
}
