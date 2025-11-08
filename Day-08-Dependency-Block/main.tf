resource "aws_instance" "name" {

  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    Name = "dev"
  }
  depends_on = [ aws_s3_bucket.name ]

}


resource "aws_s3_bucket" "name" {
  
  bucket = "devopsmulticloudaymanfar9716"

}