#Variable for Create Instance Module
variable "public_key_path" {
    description = "Public Key Path"
    default = "~/.ssh/levelup_key.pub"
}

variable "VPC_ID" {
     type = "string"
     default = ""  
}

variable "ENVIRONMENT" {
    type = "string"
    default = ""  
}

variable "AWS_REGION" {
    type = "string"
    default = "us-west-2"  
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-087c17d1fe0178315"
        us-east-2 = "ami-00dfe2c7ce89a450b"
        us-west-2 = "ami-0892d3c7ee96c0bf7"
        us-west-1 = "ami-011996ff98de391d1"
    }
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "PUBLIC_SUBNETS" {
  type = list
}
