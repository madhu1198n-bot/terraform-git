terraform {
  backend "s3" {
    bucket         = "meghas3-bucket16"
    key            = "terraform-git/terraform.tfstate"
    region         = "ap-south-1"          # change if your bucket is in another region
    dynamodb_table = "terraform-lock"      # must exist (or create separately)
    encrypt        = true
  }
}
