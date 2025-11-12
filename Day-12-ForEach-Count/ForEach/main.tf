variable "env" {

  default = ["dev","prod","test"]
  type = list(string)

}


resource "aws_instance" "name" {

  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  for_each = toset(var.env)
  tags = {
    Name = each.value
  }

}
