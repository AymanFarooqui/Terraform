resource "aws_key_pair" "name" {
  
  key_name   = "test"
  public_key = file("~/.ssh/id_ed25519.pub")  #Specify the key location


}



resource "aws_instance" "name" {
    
    ami = "ami-0bdd88bd06d16ba03"
    instance_type = "t3.micro"
    tags = {
      Name = "dev"
    }

}