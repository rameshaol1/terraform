resource "aws_instance" "MyFirstInstance" {
  ami = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"

  tags = {
    name = "demoinstance"
  }

  security_groups = "${var.Security_Group}"
}