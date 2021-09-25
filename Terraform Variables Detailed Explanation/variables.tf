variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "us-west-2"
}

variable "Security_Group"{
    type = "list"
    default = ["sg-24076", "sg-90837", "sg-35290"]
}
