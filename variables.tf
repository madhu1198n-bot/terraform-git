variable "instance_type" {
  description = "EC2 instance type (e.g. t2.micro)"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name for the AWS key pair (no .pem extension)"
  type        = string
}

variable "bucket" {
  description = "S3 bucket name"
  type        = string
}

variable "file_name" {
  description = "Local path where the PEM file should be saved"
  type        = string
}
