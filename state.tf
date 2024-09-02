terraform {
  backend "s3" {
    bucket = "bucket"
    key    = "params/terraform.tfstate"
    region = "us-east-1"
  }
}