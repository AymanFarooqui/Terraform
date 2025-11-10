resource "aws_vpc" "three-tier" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "3-tietr-vpc"
    }
}