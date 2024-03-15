terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40"
    }
  }
  backend "s3" {
    bucket = "azemii"
    key    = "tfstate/terraform.tfstate"
    region = "eu-west-2"
  }
}

# provider "aws" {
#   region     = var.region
#   access_key = var.access_key
#   secret_key = var.secret_key
# }