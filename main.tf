module "create_pem_key" {
    source = "./create_pem"
    file_name = var.file_name
}

module "create_ec2" {
    source = "./create_ec2"
    instance_type = var.instance_type
    key_name = var.key_name
    ami = var.ami
}

module "create_dynamodb" {
    source = "./create_dynamodb"
}

# dummy resource just for testing branch and Atlantis PR
resource "null_resource" "atlantis_test" {
  provisioner "local-exec" {
    command = "echo 'Hello from Atlantis test branch!'"
  }
}
