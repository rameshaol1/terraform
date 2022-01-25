data "aws_availability_zones" "available" {}


resource "aws_instance" "MyFirstInstnace10" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[1]
  
  tags = {
    Name = "terraform-linux001"
  }
}