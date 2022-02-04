resource "aws_key_pair" "levelup_key" {
  key_name = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

#Create AWS istance
resource "aws_instance" "MyFirstInstance" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    availability_zone = "us-west-2b"
    key_name  = aws_key_pair.levelup_key.key_name
    vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
    subnet_id = aws_subnet.levelupvpc-public-2.id

    tags = {
      "Name" = "custom instance"
    }
}

output "public_ip" {
    value = aws_instance.MyFirstInstance.public_ip
}