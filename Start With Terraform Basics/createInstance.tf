resource "aws_instance" "aws-practice-instance" {
   count = 3
   ami = "ami-0c2d06d50ce30b442"
   instance_type = "t2.micro"
}

   tags  {
      Name = "aws-linux00-$(count.index)"
   }