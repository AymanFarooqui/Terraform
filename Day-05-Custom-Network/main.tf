resource "aws_vpc" "name" {

  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev"
  }

}


resource "aws_subnet" "name-1" {
  
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-1-public"
  }
}


resource "aws_subnet" "name-2" {
  
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-2-private"
  }
}


resource "aws_internet_gateway" "name" {

  vpc_id = aws_vpc.name.id

}

resource "aws_route_table" "name" {
  
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }

}


resource "aws_route_table_association" "name" {

  subnet_id = aws_subnet.name-1.id
  route_table_id = aws_route_table.name.id
  
}


resource "aws_security_group" "name" {

  vpc_id = aws_vpc.name.id
  tags = {
    Name = "dev-sg"
  }

  ingress {

    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  
  }

  ingress {

    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}



resource "aws_instance" "name" {
  
  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.name.id ]
  subnet_id = aws_subnet.name-1.id
  associate_public_ip_address = true

}