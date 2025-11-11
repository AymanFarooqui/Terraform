locals {
  bucket-name = "${var.layer}-${var.env}-multicloud-ayman"
}

resource "aws_s3_bucket" "demo" {

    # bucket = "web-dev-bucket"
    # bucket = "${var.layer}-${var.env}-multicloud-ayman"
    bucket = local.bucket-name
    tags = {
        # Name = "${var.layer}-${var.env}-multicloud-ayman"
        Name = local.bucket-name
        Environment = var.env
    }
    
}