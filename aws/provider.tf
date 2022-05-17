terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = "Your Access Key"
  secret_key = "Your Secret Key"
  region = "eu-west-3"
}

