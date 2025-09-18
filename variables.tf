variable "instance_type" {
    description = "ec2 instance type"
    type = string
}

variable "ami" {
    description = "ami id for the instance"
    type = string
}

variable "key_name" {
    description = "key name for the ec2 instance"
    type = string
}

variable "bucket" {
    description = "bucket name"
    type = string
}