resource "aws_instance" "name" {

  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"

}

resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name ="dev"
  }

}

# It is used to target only specific resources in the code
# terraform plan --target=aws_resource.name
# terraform apply --target=aws_resource.name
# terraform destroy --target=aws_resource.name