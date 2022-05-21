resource "aws_key_pair" "ctf_key" {
  key_name   = "ctf-key"
  public_key = file("~/.ssh/ctf/id_rsa.pub")
}

resource "aws_instance" "vm_ctfd" {
  ami           = "ami-0fdc5ad8a8cfb4d44" // debian-11
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ctf_key.key_name

  network_interface {
    network_interface_id = aws_network_interface.ctfd_net_interface.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 256
  }

  tags = {
    Name = "vm-CTFd"
  }
}

resource "aws_instance" "vm_bastion" {
  ami           = "ami-04e905a52ec8010b2" // debian-10
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ctf_key.key_name

  network_interface {
    network_interface_id = aws_network_interface.ctfd_net_interface.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 32
  }

  tags = {
    Name = "vm-bastion"
  }
}