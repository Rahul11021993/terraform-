terraform {
  backend "s3" {
    bucket = "devops2027-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}