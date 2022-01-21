variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "us-west-2"
}

variable "Security_Group" {
    type = "list"
    default = ["sg-34432", "sg-69790", "sg-93652"]
}