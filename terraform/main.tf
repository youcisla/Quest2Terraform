provider "aws" {
  region = "eu-west-3"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = aws_vpc.my_vpc.id
}
