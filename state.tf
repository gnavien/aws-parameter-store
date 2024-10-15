terraform {
  backend "s3" {
    bucket = "navien-2"
    key    = "params/terraform.tfstate"
    region = "us-east-1"
  }
}