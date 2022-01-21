resource "aws_instance" "aws-practice-instance" {
   count = 1
   ami = "ami-0892d3c7ee96c0bf7"
   instance_type = "t2.micro"

   tags = {
      Name = "demoinstance-${count.index}"
   }
}