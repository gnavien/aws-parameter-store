terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "params/terraform.tfstate"
    region = "us-east-1"
  }
}