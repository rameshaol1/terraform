#Create AWS S3 Bucket
resource "aws_s3_bucket" "levelup-s3bucket" {
    bucket = "levelup-bucket-0402"
    acl = "private"

    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
    tags = {
      "Name" = "levelup-bucket-0402"
    }
}

