variable "aws_region" {
  default = "ap-south-1"
}

variable "profile" {
  default = "rahul-admin"
}

variable "shared_credentials_file" {
  default = "/home/rahul/.aws/credentials"
}

variable "tags" {
  type = map(string)
  default = {
    application = "parity-function"
    environment = "dev"
  }
}