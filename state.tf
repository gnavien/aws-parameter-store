terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "param/terraform.tfstate"
    region = "us-east-1"
  }
}