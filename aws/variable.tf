variable "AWSAccessKeyId" {
  type = string
}

variable "AWSSecretKey" {
  type = string
}

variable "region" {
  default = "eu-west-3"
  type    = string
}

variable "zone" {
  default = "eu-west-3a"
  type    = string
}