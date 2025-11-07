resource "aws_instance" "name" {

  ami = "ami-0157af9aea2eef346"
  instance_type = "t3.micro"
  tags = {
    Name = "ec2"
  }

}


# terraform import resource.name resource_id/resource_name

# Ex: terraform import aws_instance.name id-0157af9aea2eef34