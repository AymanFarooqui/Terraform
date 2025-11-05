resource "aws_instance" "name" {
  
  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  
#   lifecycle {
#     create_before_destroy = true
#   }

#   lifecycle {
#     ignore_changes = [ tags, ]
#   }
  
#   lifecycle {
#     prevent_destroy = true
#   }


}