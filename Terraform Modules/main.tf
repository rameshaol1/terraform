module "ec2_cluster" {
    source = "https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"

    name = "my-cluster"
    ami  = "ami-0892d3c7ee96c0bf7"
    instance_type = "t2.micro"
    subnet_id = "subnet-070460943cccd0547"

    tags = {
        Terraform = "true"
        Environment = "dev"
    }
  
}