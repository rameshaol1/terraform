variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIAUORRFWQM7JRNO3UA"
}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "us-west-2"
}

variable "Security_Group" {
    type = list 
    default = ["sg-34432", "sg-69790", "sg-93652"]
}

variable "AMIS"{
    type = map
    default = {
        us-east-1 = "ami-087c17d1fe0178315"
        us-east-2 = "ami-00dfe2c7ce89a450b"
  }
}