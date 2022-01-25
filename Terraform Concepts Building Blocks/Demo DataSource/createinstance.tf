
resource "aws_instance" "MyFirstInstnace10" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  
  tags = {
    Name = "terraform-linux001"
  }
}