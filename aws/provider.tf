terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = var.AWSAccessKeyId
  secret_key = var.AWSSecretKey
  region = "eu-west-3"
}

