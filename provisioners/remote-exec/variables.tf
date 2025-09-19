variable "instance_type" {
    type = string
}

variable "ami_id" {
    type = string
}

variable "key_name" {
    type = string
}
# 
variable "private_key" {
    type = string 
}

variable "commands" {
    type = list(string)
}