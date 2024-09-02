terraform {
  backend "s3" {
    bucket = "navien"
    key    = "params/terraform.tfstate"
    region = "us-east-1"
  }
}