#Create Instance using Custom VPC
#Resource Key Pair
resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.public_key_path)  
}

#Security Group for Instances
resource "aws_security_group" "allow-ssh" {
    vpc_id = var.VPC_ID
    name = "allow-ssh-${var.ENVIRONMENT}"
    description = "Security group that allows SSH traffic"

    egress  {
      from_port = 0
      protocol = "-1"
      to_port = 0
      cidr_blocks = "0.0.0.0/0"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = "0.0.0.0/0"
    }

    tags = {
      "Name" = "allow-ssh"
      Environment = var.ENVIRONMENT
    }  
}

#Create Instance group
resource "aws_instance" "my-instance" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = var.INSTANCE_TYPE 
}

#The VPC Subnet
subnet_id = element(var.PUBLIC_SUBNETS, 0)
availability_zone = "${AWS_REGION}b"

#The Security Group
vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

tags = {
    Name         = "instance-${var.ENVIRONMENT}"
    Environmnent = var.ENVIRONMENT
}







