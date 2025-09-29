module "ec2_instance" {
    source = "./create_ec2"
    instance_type = var.instance_type
    ami = var.ami
    key_name = var.key_name
}
# Dummy safe resource just to test Atlantis
resource "null_resource" "atlantis_test" {
  triggers = {
    always_run = timestamp()
  }
}