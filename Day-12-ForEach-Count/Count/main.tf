# resource "aws_instance" "name" {

#   ami = "ami-0bdd88bd06d16ba03"
#   instance_type = "t3.micro"
#   count = 2         # Creates resources based on count number
#   tags = {
#     Name = "dev-${count.index}"
#   }

# }


variable "env" {

  default = ["dev","prod","test"]
  type = list(string)

}


resource "aws_instance" "name" {

  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  count = length(var.env)
  tags = {
    Name = var.env[count.index]
  }

}
