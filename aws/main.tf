resource "aws_instance" "vm_ctfd" {
  ami           = "ami-0fdc5ad8a8cfb4d44" // debian-11
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.ctf_net_interface.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 256
  }

  tags = {
    Name = "vm-CTFd"
  }
}