resource "aws_vpc" "ctf_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "ctf-vpc"
  }
}

resource "aws_subnet" "ctf_subnet" {
  vpc_id            = aws_vpc.ctf_vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = var.zone

  tags = {
    Name = "ctf-subnet"
  }
}

resource "aws_network_interface" "ctfd_net_interface" {
  subnet_id   = aws_subnet.ctf_subnet.id
  private_ips = ["172.16.1.100"]

  security_groups = [
    aws_security_group.allow_https.id
  ]

  tags = {
    Name = "ctfd-net-interface"
  }
}