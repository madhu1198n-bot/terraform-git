resource "aws_instance" "my_instance" {
    instance_type = var.instance_type
    ami = var.ami
    key_name = var.key_name

root_block_device {
    volume_size = 8
    volume_type = "gp2"
    delete_on_termination = false

    tags = {
        Name = "myinstancerootvolume"
    }
}
}
