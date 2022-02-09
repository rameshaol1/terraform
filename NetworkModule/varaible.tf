variable "region" {
  default = "us-west-2"  
}

variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/levelup_key.pub"
}

variable "instance_ami" {
  description = "AMI for EC2 instance"
  default = "ami-0892d3c7ee96c0bf7"
}

variable "instance_type" {
  default = "t2.micro"  
  
}

variable "environment_tag" {
  description = "Environment tag"
  default = "Production"
}