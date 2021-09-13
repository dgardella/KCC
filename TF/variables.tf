variable "region" {
  default = "eu-west-1"
}

variable "prefix" {
  description = "Prefix to be used in the resources created"
  type = string
  default = "KCC"
}

variable "aws_account" {
  description = "AWS account"
  type = number
  default = 384647462792
}