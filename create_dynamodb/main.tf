resource "aws_dynamodb_table" "my-db-table" {
    name = "terrform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "terraform-state-lock-table"
    }
}