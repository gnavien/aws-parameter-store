terraform {
  backend "s3" {
    bucket = "navien-1"
    key    = "params/terraform.tfstate"
    region = "us-east-1"
  }
}