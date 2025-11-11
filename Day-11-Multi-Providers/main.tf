resource "aws_instance" "name" {            # create in region-1

  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    Name = "dev-01"
  }

}

resource "aws_s3_bucket" "name" {           # create in region-2

  bucket = "day-11-multi-providers-devops"
  provider = aws.oregon
  
}