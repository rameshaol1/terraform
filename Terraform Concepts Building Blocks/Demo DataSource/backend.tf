terraform {
  backend "s3" {
      bucket = "tfstate-krk"
      key    = "development/terraform_state"
      region = "us-west-2"
  }

}