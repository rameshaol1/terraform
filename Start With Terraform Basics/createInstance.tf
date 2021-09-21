provider "aws" {
  access_key = "AKIAXMQMEQ35UU7KVE4K"
  secret_key = "SECRET KEY_HERE"
  region = "us-west-2" 
}

resource "aws_instance" "MyFirstInstance" {
  ami = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
}