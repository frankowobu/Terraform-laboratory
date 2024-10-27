provider "aws" {
  profile = "243537103529_SystemAdministrator"
  region = "us-east-1"
}

variable "cidr_block" {
  type        = list(object(
    {cidr_block= string,
    name = string}
  ))
  description = "cidr block for the vpc and subnet"
}

variable "available_zone" {
  type        = list(string)
  description = "available zones"
}


resource "aws_vpc" "dev_vpc" {
  cidr_block = var.cidr_block[0].cidr_block
  tags = {
    Name = var.cidr_block[0].name
  }
}
resource "aws_subnet" "dev_subnet-1" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.cidr_block[1].cidr_block
  availability_zone = var.available_zone[0]

  tags = {
    Name = var.cidr_block[1].name
  }
}


