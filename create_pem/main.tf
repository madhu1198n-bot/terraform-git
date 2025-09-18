resource "tls_private_key" "ec2_keys" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "my_keys" {
    key_name = "ec2_keys"
    public_key = tls_private_key.ec2_keys.public_key_openssh
}

resource "local_file" "my-file" {
    content = tls_private_key.ec2_keys.private_key_pem
    filename = var.file_name
}