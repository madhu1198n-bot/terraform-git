resource "aws_s3_bucket" "my_bucket" {
    bucket = var.bucket
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = var.bucket
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my-sse" {
    bucket = var.bucket
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
} 