resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PRIVATE_KEY)
}

resource "aws_instance" "MyFirstInstance" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name = aws_key_pair.levelup_key.key_name

    tags = {
        name = "custom-instance"
    }
}

#EBS volume creation
resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "us-west-2a"
    size = 50
    type = "gp2"
    tags = {
      name = "Second Volume disk"
    }
}

#Attach EBS volume to EC2 instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    volume_id = aws_ebs_volume.ebs-volume-1.id
    instance_id = aws_instance.MyFirstInstance.id
}