variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "Security_Group" {
  type = list 
  default = ["sg-34432", "sg-69790", "sg-93652"]
}

varibale "AMIS"{
  type = map
  default = {
      us-east-1 = "ami-087c17d1fe0178315"
      us-east-2 = "ami-00dfe2c7ce89a450b"
      us-west-2 = "ami-0892d3c7ee96c0bf7"
      us-west-1 = "ami-011996ff98de391d1"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}