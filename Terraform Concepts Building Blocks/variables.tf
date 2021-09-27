
variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIAXMQMEQ35YYPKZSIP"
}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = map
  default = {
      us-east-1 = "ami-0f40c8f97004632f9"
      us-east-2 = "ami-05692172625678b4e"
      us-west-2 = "ami-02c8896b265d8c480"
      us-west-1 = "ami-0cdd3aca00188622e"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "terraadmin"
}