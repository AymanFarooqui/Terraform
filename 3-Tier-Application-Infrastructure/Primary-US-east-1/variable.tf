variable "rds-password" {
    description = "rds password"
    type = string
    default = "Cloud123"
  
}
variable "rds-username" {
    description = "rds username"
    type = string
    default = "admin"
  
}
variable "ami" {
    description = "ami"
    type = string
    default = "ami-0bdd88bd06d16ba03"
  
}
variable "instance-type" {
    description = "instance-type"
    type = string
    default = "t3.micro"
  
}
variable "key-name" {
    description = "keyname"
    type = string
    default = "us-east-1"
  
}
variable "backupr-retention" {
    type = number
    default = "7"
  
}