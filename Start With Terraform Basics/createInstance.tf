resource "aws_instance" "aws-first-instance" {
   ami = "ami-0c2d06d50ce30b442"
   instance_type = "t2.micro"
}
