resource "aws_instance" "name" {

  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    Name = "dev"
  }

}


resource "aws_s3_bucket" "name" {

    bucket = "day11-multiclouddevops-ayman"
  
}
