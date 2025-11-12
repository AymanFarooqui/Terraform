
# Example-1

variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type        = string
  nullable    = false
  default     = "us-east-1"   #Here we need to define either us-east-1 or us-west-2 if i give other region will get error 
  validation {
    condition = var.aws_region == "us-east-1" || var.aws_region == "us-west-2"
    error_message = "The variable 'aws_region' must be one of the following regions: us-west-2, eu-west-1"
  }
}


provider "aws" {
  region = "us-east-1"
}


 resource "aws_s3_bucket" "dev1" {
    bucket = "statefile-configure-dev-ayman"
}


#After run this will get error like The variable 'aws_region' must be one of the following regions: us-east-1,│ us-west-2, so it will allow any one region defined above in conditin block


# Example-2

variable "create_bucket" {
  type    = bool
  default = true
}

resource "aws_s3_bucket" "dev2" {
  count  = var.create_bucket ? 1 : 0
  bucket = "devops-ayman-g7"
}

## Example-3

variable "environment" {

  default = ""
  type = string
  
}

resource "aws_instance" "example" {
  count         = var.environment == "prod" ? 3 : 1
  ami           = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    Name = "example-${count.index}"
  }
}

#In this case:
#If var.environment == "prod" → count = 3
#Else (like dev, qa, etc.) → count = 1
#terraform apply -var="environment=dev"